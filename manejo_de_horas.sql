SELECT  TO_TIMESTAMP('14:25:10.147','HH24:MI:SS.FF') AS HoraConFecha
FROM DUAL;
        TO_TIMESTAMP('2000-01-01 14:25:10.147','YYYY-MM-DD HH24:MI:SS.FF') AS HoraSinFecha



--Este formato no muestra la hora
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';
select promo.fecha_promo.fecha_inicio,promo.fecha_promo.fecha_fin
from promocion promo

--Este formato si muestra la hora 
alter SESSION set nls_date_format='DD-MON-RR HH24:MI:SS' ; 
select promo.fecha_promo.fecha_inicio,promo.fecha_promo.fecha_fin
from promocion promo

--Esto muestra la fecha como char, pero la fecha con la hora
select  TO_CHAR(promo.fecha_promo.fecha_inicio,'DD/MM/YYYY HH24:MI:SS'),promo.fecha_promo.fecha_fin
from promocion promo

--Esto muestra la fecha como char, pero solo la hora completa
select  TO_CHAR(promo.fecha_promo.fecha_inicio,'HH24:MI:SS'),promo.fecha_promo.fecha_fin
from promocion promo

--INSERTAMOS UNA PROMOCION CON FECHA Y HORA
    EXECUTE INSERTAR_PROMOCION_CON_ID_PUESTO(1000, 'Promo 50%',50, TO_DATE('2022-12-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-12-01 10:20:00', 'YYYY-MM-DD HH24:MI:SS'),10);

--Esto muestra la fecha como char, pero solo la hora de la fecha
select  TO_CHAR(promo.fecha_promo.fecha_inicio,'HH24'),promo.fecha_promo.fecha_fin
from promocion promo

--Asi se inserta un tipo date pero con la hora, y no da problemas pero cuando esta con el formato con hora activo
    INSERT INTO "USER_PROYECTO"."PERSONA" (ID, CEDULA, NOMBRE, APELLIDO, GENERO, TELEFONO, FECHA_NAC, CLIENTE, EMPLEADO) VALUES ('211', '32333333', 'Joely', 'Lugo', 'F', '23374638443', TO_DATE('1970-12-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '0')
