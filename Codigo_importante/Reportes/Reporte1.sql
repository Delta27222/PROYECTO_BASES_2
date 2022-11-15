create or replace procedure reporte_1(cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE)
is 
begin
    open cur for
--        select s.direccion, p.nombre platos, p.foto, p.descripcion ,c.tipo, fecha_ini, fecha_fin, count(pc.id_plato) cant_veces_sol,
--        concat(round((count(pc.id_plato)*100)/avg.porcentaje),'%') porcentaje, p.precio precio_unitario
--        from plato_consumido pc
--        join consumo c
--        on c.id = pc.id_consumo
--        join (
--            Select c.ID_sucursal sucursal, count(pc.id_plato) porcentaje
--            from plato_consumido pc
--            join consumo c
--            on c.id = pc.id_consumo
--            where c.fecha_consumo.fecha_inicio BETWEEN fecha_ini and fecha_fin
--            group by c.ID_sucursal
--        ) avg
--        on c.id_sucursal = avg.sucursal
--        join plato p
--        on p.id = pc.id_plato
--        JOIN SUCURSAL S
--        ON s.id = c.id_sucursal
--        where c.fecha_consumo.fecha_inicio BETWEEN fecha_ini and fecha_fin
--        group by p.nombre, avg.porcentaje, s.direccion, c.tipo, p.precio, p.foto, p.descripcion
--        order by avg.sucursal, p.nombre, c.tipo;

            select s.direccion, p.nombre, p.foto, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%'), p.precio porcentaje
            from sucursal s
            join (
                select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                from sucursal s
                join consumo c
                on c.id_sucursal = s.id
                join plato_consumido pc
                on pc.id_consumo = c.id
                group by s.direccion
            ) t
            on t.direccion = s.direccion
            join (
                select s.direccion, p.nombre plato_nombre, c.tipo, count(pc.id_plato) total_plato --QUERY QUE TRAE LA CANTIDAD DE PEDIDOS POR PLATO POR SUCURSAL
                from sucursal s
                join consumo c
                on c.id_sucursal = s.id
                join plato_consumido pc
                on pc.id_consumo = c.id
                join plato p
                on p.id = pc.id_plato
                group by s.direccion, p.nombre, c.tipo
            ) d
            on d.direccion = s.direccion
            join plato p
            on p.nombre = d.plato_nombre;
end;


