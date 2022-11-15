create or replace NONEDITIONABLE procedure INSERTAR_PLATO(NOMBRE VARCHAR, PRECIO NUMBER, CATEGORIA VARCHAR)
is 
Begin
    DECLARE
        V_TEMP BLOB;    -- GUARDA TEMPORALMENTE LA VARIABLE QUE ESTA EN LA RUTA
        V_BFILE BFILE;  -- BUSCA EL ARCHIVO PARA SABER SI EXISTE
        V_NAME_IMAGE VARCHAR(50);   -- GUARDA EL NOMBRE DE LA IMAGEN

        descripcion_comida varchar(100);

    --CREATE OR REPLACE DIRECTORY IMAGENES_COMIDA AS 'C:\imagenes_Proyecto_Bases_2\Comida\';
    --GRANT READ,WRITE ON DIRECTORY IMAGENES_EMPLEADO TO USER_PROYECTO;

    BEGIN
        --INSERT

        if (CATEGORIA = 'Comida' ) then
            descripcion_comida:='Exquisito plato de ' || NOMBRE || ' de la mejor calidad en ' || CATEGORIA;
        end if;

        if (CATEGORIA = 'Bebida') then
            descripcion_comida:= NOMBRE || ' de la mejor calidad en ' || CATEGORIA;
        end if;


        if (CATEGORIA = 'Postre') then
            descripcion_comida:= 'Excelente ' || NOMBRE || ' de la mejor calidad en ' || CATEGORIA;
        end if;

        INSERT INTO PLATO VALUES(NOMBRE,SEQ_PLATO.NEXTVAL,MONTO(MONTO.VALIDATE_MONTO(PRECIO),'$'),EMPTY_BLOB(),descripcion_comida,CATEGORIA) Returning FOTO INTO V_TEMP;

        V_NAME_IMAGE := NOMBRE ||'.jpg';

        V_BFILE := BFILENAME('IMAGENES_COMIDA',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE

        DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA

        DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB

        DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE

        COMMIT;
    END;
end;