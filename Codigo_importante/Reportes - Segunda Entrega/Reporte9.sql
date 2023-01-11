
create or replace procedure reporte_9 (cur in out sys_refcursor, n_sucursal String, m_ini integer, m_fin integer)
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
end if;



open cur for
    select s.direccion sucursal, b.mes, (round(((b.promotores*10)/a.cant_respuestas),2)) nivel, b.observaciones
        from sucursal s
        join (
            select id_sucursal, p.mes, count(valoracion) cant_respuestas
            from encuesta e
            join (
                select e.id,
                CONCAT(CONCAT(decode ((select extract (MONTH FROM e.fecha_encuesta.fecha_inicio) FROM DUAL),
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
                12,'DICIEMBRE'),' '), (select extract (YEAR FROM e.fecha_encuesta.fecha_inicio) FROM DUAL)) MES
                from encuesta e
                where extract(month from e.fecha_encuesta.fecha_inicio) between var_m_ini and var_m_fin
            ) p
            on p.id = e.id
            group by id_sucursal, p.mes
            order by id_sucursal, p.mes desc
        ) a 
        on a.id_sucursal = s.id
        join (
            select id_sucursal, p.mes, sum(valoracion) promotores, listagg(concat('o.- ',e.observacion),chr(13)) 
            WITHIN GROUP (ORDER BY e.ID_sucursal) as observaciones
            from encuesta e
            join (
                select e.id, 
                CONCAT(CONCAT(decode ((select extract (MONTH FROM e.fecha_encuesta.fecha_inicio) FROM DUAL),
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
                12,'DICIEMBRE'),' '), (select extract (YEAR FROM e.fecha_encuesta.fecha_inicio) FROM DUAL)) MES
                from encuesta e
                where extract(month from e.fecha_encuesta.fecha_inicio) between var_m_ini and var_m_fin
            ) p
            on p.id = e.id
            group by id_sucursal, p.mes
            order by id_sucursal, p.mes desc
        )b
        on b.id_sucursal = s.id
        and a.mes = b.mes
        where s.direccion like var_n_sucursal;
end;    
end;