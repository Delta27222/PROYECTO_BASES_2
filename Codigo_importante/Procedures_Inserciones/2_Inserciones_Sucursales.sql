-- PROCEDURE PARA INSERTAR EN LA TABLA DE RESTAURANTE
CREATE OR REPLACE PROCEDURE INSERTAR_SUCURSALES
IS
    --CREATE OR REPLACE DIRECTORY IMAGENES_RESTAURANTE AS 'C:\imagenes_Proyecto_Bases_2\Restaurante\';
BEGIN
    DECLARE
        V_TEMP BLOB;    -- GUARDA TEMPORALMENTE LA VARIABLE QUE ESTA EN LA RUTA
        V_BFILE BFILE;  -- BUSCA EL ARCHIVO PARA SABER SI EXISTE
        V_NAME_IMAGE VARCHAR(20);   -- GUARDA EL NOMBRE DE LA IMAGEN

    BEGIN
        --INSERT
        INSERT INTO SUCURSAL VALUES(1,'RESTAURANTE 1',EMPTY_BLOB()) Returning LOGO INTO V_TEMP;

        V_NAME_IMAGE := 'mapa_suc_1.jpg';

        V_BFILE := BFILENAME('IMAGENES_RESTAURANTE',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;

    END;
END;

execute INSERTAR_RESTAURANTE('Angel',1);