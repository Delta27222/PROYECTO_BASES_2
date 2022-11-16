create or replace procedure reporte_5 (cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE, nombre_sucursal sucursal.direccion%type, erol rol.nombre%type)
is
begin
    if (fecha_ini is not null) and (fecha_fin is not null) and (nombre_sucursal is not null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio between fecha_ini and fecha_fin
                and s.direccion = nombre_sucursal and r.nombre = erol;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is not null) and (nombre_sucursal is not null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio <= fecha_fin
                and s.direccion = nombre_sucursal and r.nombre = erol;
    end if;
    
    if (fecha_ini is not null) and (fecha_fin is null) and (nombre_sucursal is not null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio >= fecha_ini 
                and s.direccion = nombre_sucursal and r.nombre = erol;
    end if;
    
    if (fecha_ini is not null) and (fecha_fin is not null) and (nombre_sucursal is null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio between fecha_ini and fecha_fin
                and r.nombre = erol;
    end if;
    
    if (fecha_ini is not null) and (fecha_fin is not null) and (nombre_sucursal is not null) and (erol is null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio between fecha_ini and fecha_fin
                and s.direccion = nombre_sucursal;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is null) and (nombre_sucursal is not null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where s.direccion = nombre_sucursal and r.nombre = erol;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is not null) and (nombre_sucursal is  null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio <= fecha_fin
                and r.nombre = erol;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is not null) and (nombre_sucursal is not null) and (erol is  null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio <= fecha_fin
                and s.direccion = nombre_sucursal;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is null) and (nombre_sucursal is null) and (erol is not null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where  r.nombre = erol;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is null) and (nombre_sucursal is not null) and (erol is null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where s.direccion = nombre_sucursal ;
    end if;
    
    if (fecha_ini is not null) and (fecha_fin is null) and (nombre_sucursal is null) and (erol is null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio >= fecha_ini;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is not null) and (nombre_sucursal is null) and (erol is null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id
                where e.fecha_contratacion.fecha_inicio <= fecha_fin;
    end if;
    
    if (fecha_ini is  null) and (fecha_fin is  null) and (nombre_sucursal is  null) and (erol is  null) then
        open cur for
                select s.direccion, e.foto, p.cedula, p.nombre, p.apellido, p.genero, e.fecha_contratacion.fecha_inicio fecha_contratacion, 
                e.fecha_contratacion.fecha_fin fecha_egreso, e.motivo_egreso, r.nombre, r.funcion
                from sucursal s
                join empleado e
                on e.id_sucursal = s.id
                join persona p
                on p.id = e.id_persona
                join puesto pt
                on pt.id_empleado = e.id
                join rol r
                on pt.id_rol = r.id;
    end if;
        
end;