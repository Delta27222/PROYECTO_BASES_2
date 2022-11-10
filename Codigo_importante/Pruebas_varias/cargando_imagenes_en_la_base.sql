--CARGA DE IMAGENES UTILIZANDO VARIABLES DE TIPO BLOB
CREATE OR REPLACE DIRECTORY OBJETOS_LOB AS 'C:\imagenesPana\';

--CONECTARNOS CON EL USUARIO SYSTEM (TODO DESDE OTRO USUARIO SYSTEM OJO)------(OTORGAR PERMISOS AL USUARIO)
GRANT READ,WRITE ON DIRECTORY OBJETOS_LOB TO USER1;

--CREAMOS LA TABLA DONDE TENDREMOS LA IMAGEN
CREATE TABLE CAR(
    car_plate NUMBER PRIMARY KEY,
    car_name VARCHAR(20),
    car_brand VARCHAR(20),
    car_img BLOB DEFAULT EMPTY_BLOB()
);

--CREAMOS EL PROCESO PARA LA CARGA DE IMAGEN
DECLARE
    V_TEMP BLOB;    -- GUARDA TEMPORALMENTE LA VARIABLE QUE ESTA EN LA RUTA
    V_BFILE BFILE;  -- BUSCA EL ARCHIVO PARA SABER SI EXISTE
    V_NAME_IMAGE VARCHAR(20);   -- GUARDA EL NOMBRE DE LA IMAGEN

BEGIN
    --INSERT
            -- INSERT INTO CAR VALUES(100,'111','222',EMPTY_BLOB());  CON ESTA SENTENCIA PODEMOS COMPROBAR QUE SI SE INSERTA EN LA TABLA PERO VACIO EL ESPACIO DE LA IMAGEN
    INSERT INTO CAR VALUES(1,'LaFerrari','Ferrari',EMPTY_BLOB()) Returning car_img INTO V_TEMP;
    INSERT INTO CAR VALUES(2,'Urus','Lamborghini',EMPTY_BLOB()) Returning car_img INTO V_TEMP;

    V_NAME_IMAGE := '20.jpg';

    V_BFILE := BFILENAME('OBJETOS_LOB',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

    DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

    DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

    DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

    COMMIT;

END;

select * from car




-- convertir un blob a byte en jaspersoft