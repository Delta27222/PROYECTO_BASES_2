create or replace procedure reporte_1(cur in out sys_refcursor, fecha_ini DATE, fecha_fin DATE, tipo_consumo consumo.tipo%type, tipo_plato plato.categoria%type)
is 
begin
    
    if (fecha_ini is not null) and (fecha_fin is not null) and (tipo_plato is not null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio between fecha_ini and fecha_fin
                    and c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
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
                    and c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    if (fecha_ini is null) and (fecha_fin is not null) and (tipo_plato is not null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    and c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
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
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    and c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    if (fecha_ini is not null) and (fecha_fin is null) and (tipo_plato is not null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    and c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
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
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    and c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    if (fecha_ini is not null) and (fecha_fin is not null) and (tipo_plato is  null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio between fecha_ini and fecha_fin
                    and c.tipo = tipo_consumo
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
                    and c.tipo = tipo_consumo
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is not null) and (fecha_fin is not null) and (tipo_plato is not null) and (tipo_consumo is null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio between fecha_ini and fecha_fin
                    and p.categoria = tipo_plato
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
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is null) and (fecha_fin is null) and (tipo_plato is not null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
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
                    where c.tipo = tipo_consumo
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is  null) and (fecha_fin is not null) and (tipo_plato is  null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    and c.tipo = tipo_consumo
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
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    and c.tipo = tipo_consumo
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is null) and (fecha_fin is not null) and (tipo_plato is not null) and (tipo_consumo is  null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    and p.categoria = tipo_plato
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
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is not null) and (fecha_fin is null) and (tipo_plato is null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    and c.tipo = tipo_consumo
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
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    and c.tipo = tipo_consumo
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is not null) and (fecha_fin is null) and (tipo_plato is not null) and (tipo_consumo is null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    and p.categoria = tipo_plato
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
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    and p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is null) and (fecha_fin is null) and (tipo_plato is null) and (tipo_consumo is not null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.tipo = tipo_consumo
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
                    where c.tipo = tipo_consumo
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is null) and (fecha_fin is null) and (tipo_plato is not null) and (tipo_consumo is null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where p.categoria = tipo_plato
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
                    where p.categoria = tipo_plato
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is null) and (fecha_fin is not null) and (tipo_plato is null) and (tipo_consumo is null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
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
                    where c.fecha_consumo.fecha_inicio <= fecha_fin
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is not null) and (fecha_fin is null) and (tipo_plato is null) and (tipo_consumo is null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
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
                    where c.fecha_consumo.fecha_inicio >= fecha_ini 
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
    
    if (fecha_ini is null) and (fecha_fin is null) and (tipo_plato is null) and (tipo_consumo is null) then
        open cur for
                select s.direccion, p.nombre, p.foto, p.categoria, d.tipo, d.total_plato, concat(((d.total_plato*100)/t.total),'%') porcentaje, p.precio.monto 
                from sucursal s
                join (
                    select s.direccion, count(pc.id_plato) total --QUERY QUE TRAE LA CANTIDAD DE PLATOS SOLICITADOS POR SUCURSAL
                    from sucursal s
                    join consumo c
                    on c.id_sucursal = s.id
                    join plato_consumido pc
                    on pc.id_consumo = c.id
                    join plato p
                    on p.id = pc.id_plato
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
                    group by s.direccion, p.nombre, c.tipo
                ) d
                on d.direccion = s.direccion
                join plato p
                on p.nombre = d.plato_nombre
                order by s.direccion;
    end if;
    
end;


