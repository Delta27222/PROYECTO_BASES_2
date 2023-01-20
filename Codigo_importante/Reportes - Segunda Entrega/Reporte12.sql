create or replace procedure reporte_12 (cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE, nombre_sucursal sucursal.direccion%type)
is
begin
    declare
        vr_fecha_ini DATE;
        vr_fecha_fin DATE;
        vr_nombre_s sucursal.direccion%type;
    begin
        if (nombre_sucursal is null) then
            vr_nombre_s:= '%';
        else vr_nombre_s:= lower(translate(nombre_sucursal,'áéíóú�?É�?ÓÚ','aeiouAEIOU'));
        end if; 

        if (fecha_ini is null) then
            select min(e.fecha_contratacion.fecha_inicio) into vr_fecha_ini from empleado e;
        else vr_fecha_ini:= to_date(fecha_ini);    
        end if;

        if (fecha_fin is null) then
            select max(e.fecha_contratacion.fecha_inicio) into vr_fecha_fin from empleado e;
        else vr_fecha_fin:= to_date(fecha_fin);
        end if;
        
        open cur for
            select s.direccion,c.fecha_compra.fecha_inicio, p.pagos, c.total.monto from
            compra c
            join (
                select c.id, listagg(concat(p.forma_pago||': $ ',p.monto.monto),chr(13)) WITHIN GROUP (ORDER BY c.id) pagos
                            --p.nombre, pt.nombre, r.cantidad 
                from compra c
                join pago p
                on p.id_compra = c.id
                where c.fecha_compra.fecha_inicio between vr_fecha_ini and vr_fecha_fin
                group by c.id
            ) p
            on p.id = c.id
            join sucursal s
            on s.id = c.id_sucursal
            where lower(translate(s.direccion,'áéíóú�?É�?ÓÚ','aeiouAEIOU'))like vr_nombre_s;
        
    end;
end;



