create or replace procedure reporte_1(cur in out sys_refcursor, fecha_ini in DATE, fecha_fin in DATE, tipo_consumo in String, tipo_plato in  String)
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
    else vr_tipo_consumo:= tipo_consumo;
    end if;
    
    if (tipo_plato is null) then
        vr_tipo_plato:='%';
    else vr_tipo_plato:=tipo_plato;    
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
            select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, t.f_ini, t.f_fin, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
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
                and c.tipo like vr_tipo_consumo
                and p.categoria like vr_tipo_plato
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
                and c.tipo like vr_tipo_consumo
                and p.categoria like vr_tipo_plato
                group by s.direccion, p.nombre, c.tipo
            ) d
            on d.direccion = s.direccion
            join plato p
            on p.nombre = d.plato_nombre
            order by t.f_ini,s.direccion, d.tipo,p.categoria;
    
end;
end;


