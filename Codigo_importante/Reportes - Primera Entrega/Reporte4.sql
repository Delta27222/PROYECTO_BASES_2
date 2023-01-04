create or replace NONEDITIONABLE procedure reporte_4 (cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE, nombre_sucursal sucursal.direccion%type, erol rol.nombre%type)
is
Begin
declare
    vr_fecha_ini DATE;
    vr_fecha_fin DATE;
    vr_nombre_s sucursal.direccion%type;
    vr_rol rol.nombre%type;
begin

        if (nombre_sucursal is null) then
            vr_nombre_s:= '%';
        else vr_nombre_s:= lower(translate(nombre_sucursal,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
        end if;

        if (erol is null) then
            vr_rol:='%';
        else vr_rol:= lower(translate(erol,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));    
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
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido,to_char(p.FECHA_NAC), p.genero, to_char(e.fecha_contratacion.fecha_inicio) fecha_contratacion, 
                to_char(e.fecha_contratacion.fecha_fin) fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio between vr_fecha_ini and vr_fecha_fin
                and lower(translate(s.direccion,'áéíóúÁÉÍÓÚ','aeiouAEIOU'))like vr_nombre_s and lower(translate(r.nombre,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_rol;
end;
end;