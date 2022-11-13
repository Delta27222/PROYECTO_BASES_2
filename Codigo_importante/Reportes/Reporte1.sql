create or replace procedure reporte_1(cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE)
is 
begin
    open cur for
        select avg.sucursal, p.nombre platos, c.tipo, count(pc.id_plato) cant_veces_sol,
        concat(round((count(pc.id_plato)*100)/avg.porcentaje),'%') porcentaje, p.precio precio_unitario
        from plato_consumido pc
        join consumo c
        on c.id = pc.id_consumo
        join (
            Select pc.sucursal, count(pc.id_plato) porcentaje
            from plato_consumido pc
            join consumo c
            on c.id = pc.id_consumo
            group by pc.sucursal
        ) avg
        on pc.sucursal = avg.sucursal
        join plato p
        on p.id = pc.id_plato
        where c.fecha_consumo.fecha_inicio BETWEEN fecha_ini and fecha_fin
        group by p.nombre, avg.porcentaje, avg.sucursal, c.tipo, p.precio
        order by avg.sucursal, p.nombre, c.tipo;
end;


