create or replace NONEDITIONABLE procedure reporte_1(cur in out sys_refcursor, fecha_ini  DATE, fecha_fin  DATE, tipo_consumo  String, tipo_plato String)
is 
Begin
declare
    vr_fecha_ini DATE;
    vr_fecha_fin DATE;
    vr_tipo_consumo consumo.tipo%type;
    vr_tipo_plato plato.categoria%type;
begin

    if (tipo_consumo is null) then
        vr_tipo_consumo:= '%';
    else vr_tipo_consumo:= lower(translate(tipo_consumo,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));
    end if;

    if (tipo_plato is null) then
        vr_tipo_plato:='%';
    else vr_tipo_plato:=lower(translate(tipo_plato,'áéíóúÁÉÍÓÚ','aeiouAEIOU'));    
    end if;

    if (fecha_ini is null) then
        select min(c.fecha_consumo.fecha_inicio) into vr_fecha_ini from consumo c;
    else vr_fecha_ini:= to_date(fecha_ini);    
    end if;

    if (fecha_fin is null) then
        select max(c.fecha_consumo.fecha_inicio) into vr_fecha_fin from consumo c;
    else vr_fecha_fin:= to_date(fecha_fin);
    end if;

        open cur for
            select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, to_char(t.f_ini)f_ini, to_char(t.f_fin)f_fin, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
            from sucursal s
            join (
                select s.direccion, min(c.fecha_consumo.fecha_inicio) f_ini, max(c.fecha_consumo.fecha_inicio) f_fin, 
                count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                from sucursal s
                join consumo c
                on c.id_sucursal = s.id
                join plato_consumido pc
                on pc.id_consumo = c.id
                join plato p
                on p.id = pc.id_plato
                where c.fecha_consumo.fecha_inicio between vr_fecha_ini and vr_fecha_fin
                and lower(translate(c.tipo,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_tipo_consumo
                and lower(translate(p.categoria,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_tipo_plato
                group by s.direccion
            ) t
            on t.direccion = s.direccion
             join (
                select s.direccion, p.nombre plato_nombre, c.tipo, count(pc.id_plato) total_plato --QUERY QUE TRAE LA CANTIDAD DE PEDIDOS POR PLATO POR SUCURSAL
                from sucursal s
                join consumo c
                on c.id_sucursal = s.id
                join plato_consumido pc
                on pc.id_consumo = c.id
                join plato p
                on p.id = pc.id_plato
                where c.fecha_consumo.fecha_inicio between vr_fecha_ini and vr_fecha_fin
                and lower(translate(c.tipo,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_tipo_consumo
                and lower(translate(p.categoria,'áéíóúÁÉÍÓÚ','aeiouAEIOU')) like vr_tipo_plato
                group by s.direccion, p.nombre, c.tipo
            ) d
            on d.direccion = s.direccion
            join plato p
            on p.nombre = d.plato_nombre
            order by t.f_ini,s.direccion, d.tipo,p.categoria;

    end;
end;