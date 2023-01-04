create or replace NONEDITIONABLE procedure reporte_11(cur in out sys_refcursor,destino String, tipo_comida String)
is 
Begin
Declare 
    f_ini DATE;
    f_fin DATE;
    vr_ubicacion_delivery consumo.ubicacion%type;
    vr_tipo_comida plato.categoria%type;
    Begin

        if (destino is null) then
            vr_ubicacion_delivery:= '%';
        else vr_ubicacion_delivery:= lower(translate(destino,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
        end if;

        if (tipo_comida is null) then
            vr_tipo_comida:= '%';
        else vr_tipo_comida:= lower(translate(tipo_comida,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
        end if;
 open cur for
        select suc.direccion Sucursal, x.categoria Tipo_comida,x.nombre Nombre, x.foto Foto, 'Delivery' Tipo_consumo, per.nombre Nombre_cliente, per.apellido Apellido_cliente, per.telefono Telefono, con.ubicacion Direccion_entrega
        from consumo con
        join sucursal suc
        on con.id_sucursal = suc.id
        join persona per
        on con.id_cliente = per.id
        join(
            select * from plato pla
            join plato_consumido plaC
            on pla.id = plaC.id_plato
        ) x
        on con.id = x.id_consumo
        where lower(translate(con.ubicacion,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_ubicacion_delivery
        and lower(translate(x.categoria,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_tipo_comida;
    end;
end;