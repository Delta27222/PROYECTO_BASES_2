create or replace procedure reporte_6(cur in out sys_refcursor, nombre_suc string, dia varchar, f_ini date, f_fin date)
is
begin
    DECLARE
        DIA_V varchar(20);
    begin
    if upper(dia) = 'LUNES' then
        dia_v:='MONDAY';
    end if;
    if upper(dia) = 'MARTES' then
        dia_v:='TUESDAY';
    end if;
    if upper(dia) = 'MIERCOLES' then
        dia_v:='WEDNESDAY';
    end if;
    if upper(dia) = 'JUEVES' then
        dia_v:='THURSDAY';
    end if;
    if upper(dia) = 'VIERNES' then
        dia_v:='FRIDAY';
    end if;
    if upper(dia) = 'SABADO' then
        dia_v:='SATURDAY';
    end if;
    if upper(dia) = 'DOMINGO' then
        dia_v:='SUNDAY';
    end if;
        open cur for
        SELECT S.DIRECCION, s.horario ,F.HORA, COUNT(DIA) CANT_DIAS
        FROM CONSUMO C
        JOIN (
            select c.id, d.dia, TO_CHAR(c.fecha_consumo.fecha_inicio,'HH24') hora
            from consumo c
            join (
                select c.id, to_char(to_date(c.fecha_consumo.fecha_inicio), 'DAY', 'NLS_DATE_LANGUAGE=ENGLISH') dia
                from consumo c ) d
                on d.id = c.id
                WHERE D.DIA LIKE '%'||dia_v||'%'
                and c.fecha_consumo.fecha_inicio between f_ini and f_fin
                ) F
        ON F.ID = C.ID
        JOIN SUCURSAL S
        ON S.ID = C.ID_SUCURSAL
        WHERE S.DIRECCION = 'El Hatillo'
        GROUP BY HORA,S.DIRECCION, s.horario;
    end;
end;