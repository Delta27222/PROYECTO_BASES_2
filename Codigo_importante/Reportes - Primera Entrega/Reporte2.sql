create or replace NONEDITIONABLE procedure reporte_2(cur in out sys_refcursor, fecha_var DATE)
is
begin

    if (fecha_var is not null )then
        open cur for
            select pd.fecha_pla_dia.FECHA_INICIO fecha, p.categoria, p.nombre, p.foto, p.descripcion, p.precio.MONTO || p.precio.UNIDAD_MONTO  precio
            from plato p
            join plato_dia pd
            on p.id = pd.id_plato
            where to_date(pd.fecha_pla_dia.FECHA_INICIO) = to_date(fecha_var); 
    else         
        open cur for
            select pd.fecha_pla_dia.FECHA_INICIO fecha, p.categoria, p.nombre, p.foto, p.descripcion, p.precio.MONTO || p.precio.UNIDAD_MONTO precio
            from plato p
            join plato_dia pd
            on p.id = pd.id_plato;
        end if;    
end;