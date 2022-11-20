-- MOSTRAR LOS COMENTARIOS CON DBMS
set serveroutput on

SET SERVEROUTPUT ON 
DECLARE 
BEGIN 
    dbms_output.put_line('hola');
END;


-- FUNCIÓN PARA NUMEROS ALEATORIOS
Create or replace function numero_aleatorio (primer_numero number,segundo_numero number) return number
is numero_random number;
Begin
    select dbms_random.value(primer_numero,segundo_numero) into numero_random from dual;
    dbms_output.put_line(numero_random);
    Return round(numero_random);
end;






--insert en reserva funciinal
insert into reserva values (1, fecha(to_date('14-OCT-22'),to_date('14-OCT-22')), monto(monto.VALIDATE_MONTO(10), '$'), 2, 1,2)




--Insert en evento funcional
insert into evento values(3,'Las gaitas','Zero regueton',1,2,fecha(to_date('15-OCT-22'),to_date('15-OCT-22')),1,2)

--insert en grupo funcional   
insert into grupo values (1, 'Los parranderos', 'Cantan gaitas')
        

--Modificar una columna de una tabla
alter table evento
  modify nombre varchar(100)


alter table GRUPO
  modify nombre varchar(100)


alter table sucursal
  modify descripcion varchar(50)

alter table sucursal
  modify direccion varchar(50)

  alter table persona
  modify genero varchar(3)

  
  alter table rol
  modify funcion varchar(50)

  
  alter table plato
  modify descripcion varchar(100)

--Inserciones en la tabla de platos
--Comida
execute INSERTAR_PLATO('Pizza',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Pabellon',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Pasticho',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Patacones',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Cachapa',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Shawarma',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Sopa',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Parrilla',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Hamburguesa',round(dbms_random.value(20,100)),'Comida');
execute INSERTAR_PLATO('Paella',round(dbms_random.value(20,100)),'Comida');

--Bebida
execute INSERTAR_PLATO('Papelonada',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Chicha',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Jugo',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Refresco',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Tequila',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Ron',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Cerveza',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Malta',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('RicoMalt',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Ginebra',round(dbms_random.value(5,15)),'Bebida');
execute INSERTAR_PLATO('Agua',round(dbms_random.value(5,15)),'Bebida');

--Postre
execute INSERTAR_PLATO('Marquesa',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Tres leche',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Marmoleada',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Tiramisu',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Brownie',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Galleta',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Oreo',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Merengada',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Turron',round(dbms_random.value(5,15)),'Postre');
execute INSERTAR_PLATO('Helado',round(dbms_random.value(5,15)),'Postre');


--Inserciones para plato_dia (esto no funcionara para otro caso, los id no seran iguales)

insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),12);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),43);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),19);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),13);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),58);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),64);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('13-NOV-22'),to_date('13-NOV-22')),57);



insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('14-NOV-22'),to_date('14-NOV-22')),10);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('14-NOV-22'),to_date('14-NOV-22')),11);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('14-NOV-22'),to_date('14-NOV-22')),13);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('14-NOV-22'),to_date('14-NOV-22')),45);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('14-NOV-22'),to_date('14-NOV-22')),36);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('14-NOV-22'),to_date('14-NOV-22')),33);


insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),60);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),62);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),63);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),57);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),58);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),17);
insert into plato_dia values (SEQ_PLATO_DIA.NEXTVAL, fecha(to_date('15-NOV-22'),to_date('15-NOV-22')),15);




--------------------------------------INSERTANDO PROMOCIONES

--Calculo del precio final del producto con descuento
create or replace function precio_final_calculado (id_plato number, descuento number) return number
is 
    x number;
    precio_final number;
    precio_plato number;
Begin
       select p.precio.monto into precio_plato from plato p where id = id_plato;  --Encuentro el valor del precio del plato 
       x := (descuento * precio_plato)/100;
       precio_final := precio_plato - x;
       return precio_final;
end;


--De esta manera hacemos las inserciones
insert into promocion values(2, 'descuento 50', 50, monto(monto.VALIDATE_MONTO(precion_final_calculado(10, 50)),'$'),fecha(to_date('14-OCT-22'),to_date('14-OCT-22')),10); 



--Procedure para hacer inserciones de promociones
create or replace procedure INSERTAR_PROMOCION(DESCRIPCION VARCHAR, DESCUENTO NUMBER, FECHA_INICIO DATE, FECHA_FIN DATE, ID_PLATO NUMBER)
is 
    PRECIO_FINAL NUMBER;
Begin
    PRECIO_FINAL :=PRECIO_FINAL_CALCULADO(ID_PLATO, DESCUENTO);
    INSERT INTO PROMOCION VALUES(SEQ_PROMOCION.NEXTVAL, DESCRIPCION,DESCUENTO,monto(monto.VALIDATE_MONTO(PRECIO_FINAL),'$'),fecha(FECHA_INICIO,FECHA_FIN), ID_PLATO);
end;



EXECUTE INSERTAR_PROMOCION( 'Promo 50%',50, TO_DATE('12-NOV-22'),TO_DATE('15-NOV-22'),10);



--MANEJO DE HORAS EN LA BASE DE DATOS 

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
