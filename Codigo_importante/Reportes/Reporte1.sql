create or replace procedure reporte_1(cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE)
is 
begin
    open cur for
        select s.direccion, p.nombre platos, c.tipo, count(pc.id_plato) cant_veces_sol,
        concat(round((count(pc.id_plato)*100)/avg.porcentaje),'%') porcentaje, p.precio precio_unitario
        from plato_consumido pc
        join consumo c
        on c.id = pc.id_consumo
        join (
            Select c.ID_sucursal sucursal, count(pc.id_plato) porcentaje
            from plato_consumido pc
            join consumo c
            on c.id = pc.id_consumo
            where c.fecha_consumo.fecha_inicio BETWEEN fecha_ini and fecha_fin
            group by c.ID_sucursal
        ) avg
        on c.id_sucursal = avg.sucursal
        join plato p
        on p.id = pc.id_plato
        JOIN SUCURSAL S
        ON s.id = c.id_sucursal
        where c.fecha_consumo.fecha_inicio BETWEEN fecha_ini and fecha_fin
        group by p.nombre, avg.porcentaje, s.direccion, c.tipo, p.precio
        order by avg.sucursal, p.nombre, c.tipo;
end;


