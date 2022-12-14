create or replace NONEDITIONABLE PROCEDURE INSERTAR_RESTAURANTE
IS
    NUMERO_STRING VARCHAR(20);
    --CREATE OR REPLACE DIRECTORY IMAGENES_RESTAURANTE AS 'C:\imagenes_Proyecto_Bases_2\Restaurante\';
BEGIN
    DECLARE
        V_TEMP BLOB;    -- GUARDA TEMPORALMENTE LA VARIABLE QUE ESTA EN LA RUTA
        V_BFILE BFILE;  -- BUSCA EL ARCHIVO PARA SABER SI EXISTE
        V_NAME_IMAGE VARCHAR(20);   -- GUARDA EL NOMBRE DE LA IMAGEN

    BEGIN
        --INSERT
                -- INSERT INTO CAR VALUES(100,'111','222',EMPTY_BLOB());  CON ESTA SENTENCIA PODEMOS COMPROBAR QUE SI SE INSERTA EN LA TABLA PERO VACIO EL ESPACIO DE LA IMAGEN
        INSERT INTO RESTAURANTE VALUES(SEQ_RESTAURANTE.NEXTVAL,'RESTAURANTE 1',EMPTY_BLOB()) Returning LOGO INTO V_TEMP;
        NUMERO_STRING := TO_CHAR(numero_aleatorio(1,4))||'.jpg';
        dbms_output.put_line(NUMERO_STRING);

        V_NAME_IMAGE := NUMERO_STRING;

        V_BFILE := BFILENAME('IMAGENES_RESTAURANTE',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;

        INSERT INTO RESTAURANTE VALUES(SEQ_RESTAURANTE.NEXTVAL,'RESTAURANTE 2',EMPTY_BLOB()) Returning LOGO INTO V_TEMP;
        NUMERO_STRING := TO_CHAR(numero_aleatorio(1,4))||'.jpg';
        dbms_output.put_line(NUMERO_STRING);

        V_NAME_IMAGE := NUMERO_STRING;

        V_BFILE := BFILENAME('IMAGENES_RESTAURANTE',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;

        INSERT INTO RESTAURANTE VALUES(SEQ_RESTAURANTE.NEXTVAL,'RESTAURANTE 3',EMPTY_BLOB()) Returning LOGO INTO V_TEMP;
        NUMERO_STRING := TO_CHAR(numero_aleatorio(1,4))||'.jpg';
        dbms_output.put_line(NUMERO_STRING);

        V_NAME_IMAGE := NUMERO_STRING;

        V_BFILE := BFILENAME('IMAGENES_RESTAURANTE',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;

        INSERT INTO RESTAURANTE VALUES(SEQ_RESTAURANTE.NEXTVAL,'RESTAURANTE 4',EMPTY_BLOB()) Returning LOGO INTO V_TEMP;
        NUMERO_STRING := TO_CHAR(numero_aleatorio(1,4))||'.jpg';
        dbms_output.put_line(NUMERO_STRING);


        V_NAME_IMAGE := NUMERO_STRING;

        V_BFILE := BFILENAME('IMAGENES_RESTAURANTE',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;
    END;
END;