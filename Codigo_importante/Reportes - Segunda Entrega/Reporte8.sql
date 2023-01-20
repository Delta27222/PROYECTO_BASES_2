create or replace procedure reporte_8 (cur in out sys_refcursor, n_sucursal String, m_ini integer, m_fin integer)
is 
begin
    declare
    var_m_ini integer;
        var_m_fin integer;
        var_n_sucursal sucursal.direccion%type;
    begin
        if (m_ini is null) then
            var_m_ini:=1;
        end if;
        if (m_fin is null) then
            var_m_fin:=12;
        end if;
        if (n_sucursal is null) then
            var_n_sucursal:='%';
        else var_n_sucursal:= lower(translate(n_sucursal,'áéíóú�?É�?ÓÚ','aeiouAEIOU'));
        end if;
        open cur for
            select g.DIRECCION, g.mes, g.ingresos, g.egresos, case when CONTA < 0 then conta*(-1) else conta end
            from 
            ((
                SELECT S.DIRECCION, ingresos.mes, INGRESOS.INGRESOS ingresos, EGRESOS.EGRESOS egresos
                FROM SUCURSAL S
                JOIN (
                    select c.id_sucursal, p.mes,
                    sum(monto) INGRESOS
                    from contabilidad c
                    join (
                            select id_sucursal,
                            CONCAT(CONCAT(decode ((select extract (MONTH FROM c.fecha.fecha_inicio) FROM DUAL),
                            01,'ENERO',
                            02,'FEBRERO',
                            03,'MARZO',
                            04,'ABRIL',
                            05,'MAYO',
                            06,'JUNIO',
                            07,'JULIO',
                            08,'AGOSTO',
                            09,'SEPTIEMBRE',
                            10,'OCTUBRE',
                            11,'NOVIEMBRE',
                            12,'DICIEMBRE'),' '), (select extract (YEAR FROM c.fecha.fecha_inicio) FROM DUAL)) MES
                            from contabilidad c
                            where fecha is not null and extract(month from c.fecha.fecha_inicio) between var_m_ini and var_m_fin 
                            order by id_sucursal
                        ) p 
                    on p.id_sucursal = c.id_sucursal
                    where c.monto > 0
                    group by c.id_sucursal, p.mes
                    order by id_sucursal
                ) INGRESOS
                ON INGRESOS.ID_SUCURSAL = S.ID
                JOIN ( 
                    select c.id_sucursal, p.mes,
                    sum(monto) EGRESOS
                    from contabilidad c
                    join (
                            select id_sucursal,
                            CONCAT(CONCAT(decode ((select extract (MONTH FROM c.fecha.fecha_inicio) FROM DUAL),
                            01,'ENERO',
                            02,'FEBRERO',
                            03,'MARZO',
                            04,'ABRIL',
                            05,'MAYO',
                            06,'JUNIO',
                            07,'JULIO',
                            08,'AGOSTO',
                            09,'SEPTIEMBRE',
                            10,'OCTUBRE',
                            11,'NOVIEMBRE',
                            12,'DICIEMBRE'),' '), (select extract (YEAR FROM c.fecha.fecha_inicio) FROM DUAL)) MES
                            from contabilidad c
                            where fecha is not null and extract(month from c.fecha.fecha_inicio) between var_m_ini and var_m_fin 
                            order by id_sucursal
                        ) p 
                    on p.id_sucursal = c.id_sucursal
                    where c.monto < 0
                    group by c.id_sucursal, p.mes
                    order by id_sucursal
                ) EGRESOS
                ON EGRESOS.ID_SUCURSAL = S.ID
                and ingresos.mes = egresos.mes ) UNPIVOT (CONTA FOR VALOR IN (INGRESOS, EGRESOS))
            ) m
            JOIN
            (
            
                SELECT S.DIRECCION, ingresos.mes, INGRESOS.INGRESOS ingresos, EGRESOS.EGRESOS egresos
                FROM SUCURSAL S
                JOIN (
                    select c.id_sucursal, p.mes,
                    sum(monto) INGRESOS
                    from contabilidad c
                    join (
                            select id_sucursal,
                            CONCAT(CONCAT(decode ((select extract (MONTH FROM c.fecha.fecha_inicio) FROM DUAL),
                            01,'ENERO',
                            02,'FEBRERO',
                            03,'MARZO',
                            04,'ABRIL',
                            05,'MAYO',
                            06,'JUNIO',
                            07,'JULIO',
                            08,'AGOSTO',
                            09,'SEPTIEMBRE',
                            10,'OCTUBRE',
                            11,'NOVIEMBRE',
                            12,'DICIEMBRE'),' '), (select extract (YEAR FROM c.fecha.fecha_inicio) FROM DUAL)) MES
                            from contabilidad c
                            where fecha is not null and extract(month from c.fecha.fecha_inicio) between var_m_ini and var_m_fin 
                            order by id_sucursal
                        ) p 
                    on p.id_sucursal = c.id_sucursal
                    where c.monto > 0
                    group by c.id_sucursal, p.mes
                    order by id_sucursal
                ) INGRESOS
                ON INGRESOS.ID_SUCURSAL = S.ID
                JOIN ( 
                    select c.id_sucursal, p.mes,
                    sum(monto) EGRESOS
                    from contabilidad c
                    join (
                            select id_sucursal,
                            CONCAT(CONCAT(decode ((select extract (MONTH FROM c.fecha.fecha_inicio) FROM DUAL),
                            01,'ENERO',
                            02,'FEBRERO',
                            03,'MARZO',
                            04,'ABRIL',
                            05,'MAYO',
                            06,'JUNIO',
                            07,'JULIO',
                            08,'AGOSTO',
                            09,'SEPTIEMBRE',
                            10,'OCTUBRE',
                            11,'NOVIEMBRE',
                            12,'DICIEMBRE'),' '), (select extract (YEAR FROM c.fecha.fecha_inicio) FROM DUAL)) MES
                            from contabilidad c
                            where fecha is not null and extract(month from c.fecha.fecha_inicio) between var_m_ini and var_m_fin 
                            order by id_sucursal
                        ) p 
                    on p.id_sucursal = c.id_sucursal
                    where c.monto < 0
                    group by c.id_sucursal, p.mes
                    order by id_sucursal
                ) EGRESOS
                ON EGRESOS.ID_SUCURSAL = S.ID
                and ingresos.mes = egresos.mes
            ) g
            on g.direccion = m.direccion
            and g.mes = m.mes
            where lower(translate(g.direccion,'áéíóú�?É�?ÓÚ','aeiouAEIOU')) like var_n_sucursal;
        end;
end;

