-- PROCEDURE PARA INSERTAR EN LA TABLA DE EMPLEADOS

create or replace procedure INSERTAR_EMPLEADO(cedula_empleado number, id_sucursal number)
is 
Begin
    DECLARE
        V_TEMP BLOB;    -- GUARDA TEMPORALMENTE LA VARIABLE QUE ESTA EN LA RUTA
        V_BFILE BFILE;  -- BUSCA EL ARCHIVO PARA SABER SI EXISTE
        V_NAME_IMAGE VARCHAR(50);   -- GUARDA EL NOMBRE DE LA IMAGEN
        fecha_egreso date;
        fecha_contratacion date;
        numero_aleatorio number;
        motivo_egreso varchar(30);
        
    --  CREATE OR REPLACE DIRECTORY IMAGENES_EMPLEADO AS 'C:\imagenes_Proyecto_Bases_2\Empleado\';
    --  GRANT READ,WRITE ON DIRECTORY IMAGENES_EMPLEADO TO USER_PROYECTO;

    BEGIN
        --INSERT
        numero_aleatorio := round(dbms_random.value(1,41));
        select sysdate-round(dbms_random.value(0,60),0) into fecha_egreso from dual; --fecha aleatoria.
        select sysdate-round(dbms_random.value(0,60),0) into fecha_contratacion from dual; --fecha aleatoria.
        declare 
           type array_t is varray(6) of varchar2(30);
           array array_t := array_t('Mala conducta','Nuevo puesto','Compromiso','Nuevo cargo','Cambio horario','Subida de rango');
            numero_aleatorio number;
        begin
            numero_aleatorio := round(dbms_random.value(1,6));
            motivo_egreso:=array(numero_aleatorio);
        end;
        
        INSERT INTO EMPLEADO VALUES(SEQ_EMPLEADO.NEXTVAL,EMPTY_BLOB(), fecha_egreso,fecha(fecha_contratacion,fecha_contratacion),motivo_egreso,cedula_empleado,id_sucursal) Returning FOTO INTO V_TEMP;
        
        V_NAME_IMAGE := numero_aleatorio||'.jpg';

        V_BFILE := BFILENAME('IMAGENES_EMPLEADO',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;
    END;
end;