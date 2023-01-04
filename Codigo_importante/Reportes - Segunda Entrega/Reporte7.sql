create or replace NONEDITIONABLE procedure Z_reporte_7(cur in out sys_refcursor,nombre_suc String, fecha_inicio_var date, fecha_fin_var date)
is 
Begin
Declare 
    f_ini DATE;
    f_fin DATE;
    vr_nombre_suc sucursal.direccion%type;
    Begin

        if (fecha_inicio_var is null) then
            select min(inv.fecha_inventario.fecha_inicio) into f_ini from inventario inv;
        else f_ini:= to_date(fecha_inicio_var);    
        end if;

        if (fecha_fin_var is null) then
            select max(inv.fecha_inventario.fecha_inicio) into f_fin from inventario inv;
        else f_fin:= to_date(fecha_fin_var);    
        end if;

        if (nombre_suc is null) then
            vr_nombre_suc:= '%';
        else vr_nombre_suc:= lower(translate(nombre_suc,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
        end if;
    open cur for
        select suc.direccion sucursal, to_char(inv.fecha_inventario.fecha_inicio) fecha_inventario, pro.nombre producto, pro.foto foto, '3' as cantidad
        from inventario inv
        join sucursal suc
        on (inv.id_sucursal = suc.id)
        join producto pro
        on inv.id_producto = pro.id
        where inv.fecha_inventario.fecha_inicio between f_ini and f_fin
        and lower(translate(suc.direccion,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_nombre_suc;
    end;
end;
