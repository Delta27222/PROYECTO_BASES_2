create or replace procedure reporte_6_probando(cur in out sys_refcursor, nombre_suc string)
is
begin
    declare
       id_sucursal_var number; 
    begin
        select id into id_sucursal_var from sucursal where direccion = nombre_suc;
        open cur for
        select fecha, horas, count(horas) from (
                select id_sucursal, TO_CHAR(con.fecha_consumo.fecha_inicio,'DD/MM/YYYY') fecha, TO_CHAR(con.fecha_consumo.fecha_inicio,'HH24')horas from ZZZ_CONSUMO_PRUEBAS con 
                where id_sucursal = id_sucursal_var
        ) group by horas, fecha
        order by fecha;
    end;
end;