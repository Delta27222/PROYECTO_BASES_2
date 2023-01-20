create or replace procedure reporte_10 (cur in out sys_refcursor)
is
begin
    open cur for
        select s.direccion, p.nombre, p.foto, rt.receta, (round(((a.promotores*10)/b.cant_respuestas),2)) nivel
        from plato p
            join (
                select * from (
                    select id_plato, id_sucursal, sum(valoracion) promotores
                    from encuesta
                    where tipo = 'Comida'
                    group by id_plato, id_sucursal
                    order by sum(valoracion) desc
                    ) WHERE ROWNUM BETWEEN 1 AND 25  
            ) a
            on a.id_plato = p.id
        join(
            select id_plato, id_sucursal, count(valoracion) cant_respuestas
            from encuesta
            where tipo = 'Comida'
            group by id_plato,  id_sucursal
            order by id_plato
        ) b
        on b.id_plato = p.id
        join sucursal s
        on s.id = b.id_sucursal
        and s.id = a.id_sucursal
        join (
            select p.id, listagg(concat(concat(concat(r.cantidad,' '||pt.unidad),' de '), pt.nombre),chr(13)) WITHIN GROUP (ORDER BY p.nombre) RECETA
            --p.nombre, pt.nombre, r.cantidad 
            from receta r
            join plato p
            on p.id = r.id_plato
            join producto pt
            on pt.id = r.id_producto
            group by p.id
        ) rt
        on rt.id = p.id
        ORDER BY nivel desc;
end;        
                        