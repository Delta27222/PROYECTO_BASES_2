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

