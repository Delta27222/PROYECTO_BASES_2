create or replace NONEDITIONABLE procedure reporte_13(cur in out sys_refcursor,nombre_suc String, fecha_inicio_var date, fecha_fin_var date)
is 
Begin
Declare 
    f_ini DATE;
    f_fin DATE;
    vr_nombre_suc sucursal.direccion%type;
    Begin

        if (fecha_inicio_var is null) then
            select min(re.fecha_reserva.fecha_inicio) into f_ini from reserva re;
        else f_ini:= to_date(fecha_inicio_var);
        end if;

        if (fecha_fin_var is null) then
            select max(re.fecha_reserva.fecha_inicio) into f_fin from reserva re;
        else f_fin:= to_date(fecha_fin_var);
        end if;

        if (nombre_suc is null) then
            vr_nombre_suc:= '%';
        else vr_nombre_suc:= lower(translate(nombre_suc,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
        end if;
    open cur for

        select suc.direccion, suc.mapa, re.fecha_reserva.fecha_inicio, re.cant_personas, re.abono
        from sucursal suc
        join reserva re
        on suc.id = re.id_sucursal
        where re.fecha_reserva.fecha_inicio between f_ini and f_fin
        and lower(translate(suc.direccion,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_nombre_suc;

    end;
end;