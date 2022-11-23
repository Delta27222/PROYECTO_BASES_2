create or replace procedure reporte_6(cur in out sys_refcursor, nombre_suc string)
is
begin
    declare
       id_sucursal_var number; 
    begin
        select id into id_sucursal_var from sucursal where direccion = nombre_suc;
        open cur for
        select ID_SUCURSAL, fecha, horas, count(horas)REPORT_COUNT from (
                select id_sucursal, TO_CHAR(con.fecha_consumo.fecha_inicio,'DD/MM/YYYY') fecha, TO_CHAR(con.fecha_consumo.fecha_inicio,'HH24')horas from consumo con 
                where id_sucursal = id_sucursal_var
        ) group by horas, fecha, ID_SUCURSAL
        order by fecha;
    end;
end;