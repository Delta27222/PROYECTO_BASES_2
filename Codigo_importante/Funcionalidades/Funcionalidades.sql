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
