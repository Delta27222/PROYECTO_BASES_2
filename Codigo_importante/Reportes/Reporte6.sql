create or replace procedure reporte_6(cur in out sys_refcursor, 
nombre_suc string)
is
begin
    declare
       id_sucursal_var number; 
    begin
        select id into id_sucursal_var from sucursal where direccion = nombre_suc;
        open cur for
        select sp.direccion sucursal, rp.nombre nombre_restaurante, sp.horario, m.ID_SUCURSAL, m.fecha, m.horas, count(horas)REPORT_COUNT from (
                select id_sucursal, TO_CHAR(con.fecha_consumo.fecha_inicio,'DD/MM/YYYY') fecha, TO_CHAR(con.fecha_consumo.fecha_inicio,'HH24')horas from consumo con 
                where id_sucursal = 2
        ) m
        join sucursal sp
        on sp.id = m.id_sucursal
        join restaurante rp
        on rp.id = sp.id_restaurante
        group by sp.direccion, rp.nombre, sp.horario, m.ID_SUCURSAL, m.fecha, m.horas
        order by fecha;
    end;
end;