create or replace NONEDITIONABLE procedure ZZ_reporte_10 (cur in out sys_refcursor)
is
begin
    open cur for
    select w.direccion, w.nombre, w.foto, w.receta, w.nivel, 
    case 
        when ((round(((w.numerador*10)/w.denominador),2)) >= 90) and ((round(((w.numerador*10)/w.denominador),2)) <= 100) then (select face_img from face where id=1)
        when ((round(((w.numerador*10)/w.denominador),2)) >= 80) and ((round(((w.numerador*10)/w.denominador),2)) <= 89) then (select face_img from face where id=2)
        when ((round(((w.numerador*10)/w.denominador),2)) >= 70) and ((round(((w.numerador*10)/w.denominador),2)) <= 79) then (select face_img from face where id=3)
        when ((round(((w.numerador*10)/w.denominador),2)) >= 60) and ((round(((w.numerador*10)/w.denominador),2)) <= 69) then (select face_img from face where id=4)
        when ((round(((w.numerador*10)/w.denominador),2)) <= 59) then (select face_img from face where id=5)
        end img
        from face s
        join
        (

            select s.direccion direccion, p.nombre nombre, p.foto foto, rt.receta receta, (round(((a.promotores*10)/b.cant_respuestas),2)) nivel, a.promotores numerador ,b.cant_respuestas denominador
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
            ORDER BY nivel desc
        )w
        on id = 2;
end;  