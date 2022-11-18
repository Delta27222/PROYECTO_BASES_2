create or replace procedure reporte_1(cur in out sys_refcursor, fecha_ini in out DATE, fecha_fin in out DATE, tipo_consumo in out String, tipo_plato in out String)
is 
begin

    if (tipo_consumo is null) then
        tipo_consumo:= '%';
    end if;
    
    if (tipo_plato is null) then
        tipo_plato:='%';
    end if;
    
    if (fecha_ini is null) then
        select min(c.fecha_consumo.fecha_inicio) into fecha_ini from consumo c;
    end if;
    
    if (fecha_fin is null) then
        select max(c.fecha_consumo.fecha_inicio) into fecha_fin from consumo c;
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
                where c.fecha_consumo.fecha_inicio between fecha_ini and fecha_fin
                and c.tipo like tipo_consumo
                and p.categoria like tipo_plato
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
                where c.fecha_consumo.fecha_inicio between fecha_ini and fecha_fin
                and c.tipo like tipo_consumo
                and p.categoria like tipo_plato
                group by s.direccion, p.nombre, c.tipo
            ) d
            on d.direccion = s.direccion
            join plato p
            on p.nombre = d.plato_nombre
            order by s.direccion;
    
end;


