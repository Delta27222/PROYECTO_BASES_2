-- MOSTRAR LOS COMENTARIOS CON DBMS
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