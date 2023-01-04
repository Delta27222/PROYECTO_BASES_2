create or replace NONEDITIONABLE procedure reporte_14(cur in out sys_refcursor,nombre_suc String, fecha_inicio_var date, fecha_fin_var date)
is 
Begin
Declare 
    f_ini DATE;
    f_fin DATE;
    vr_nombre_suc sucursal.direccion%type;
    Begin

        if (fecha_inicio_var is null) then
            select min(even.fecha_evento.fecha_inicio) into f_ini from evento even;
        else f_ini:= to_date(fecha_inicio_var);    
        end if;

        if (fecha_fin_var is null) then
            select max(even.fecha_evento.fecha_inicio) into f_fin from evento even;
        else f_fin:= to_date(fecha_fin_var);    
        end if;

        if (nombre_suc is null) then
            vr_nombre_suc:= '%';
        else vr_nombre_suc:= lower(translate(nombre_suc,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
        end if;
    open cur for

        select suc.direccion Sucursal, to_char(even.fecha_evento.fecha_inicio) Fecha_evento, even.nombre Nombre_evento, gru.nombre Gurpo_nombre, even.condiciones Evento_condiciones, even.hora_inicio Hora_inicio, even.hora_fin Hora_fin    
        from evento even
        join sucursal suc
        on even.id_sucursal = suc.id
        join grupo gru
        on even.id_grupo = gru.id
        where even.fecha_evento.fecha_inicio between f_ini and f_fin
        and lower(translate(suc.direccion,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_nombre_suc;

    end;
end;