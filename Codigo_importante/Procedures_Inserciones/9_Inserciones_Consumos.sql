create or replace PROCEDURE INSERTAR_CONSUMO(ubicacion_var varchar, tipo_consumo varchar, id_cliente number, id_sucursal number,id_compra number,fecha_var date, id_mesa number)
IS
--    CREATE OR REPLACE DIRECTORY IMAGENES_CONSUMO AS 'C:\imagenes_Proyecto_Bases_2\Mapas\';
    --GRANT READ,WRITE ON DIRECTORY IMAGENES_CONSUMO TO USER_PROYECTO;
BEGIN
    DECLARE
        V_TEMP BLOB;    -- GUARDA TEMPORALMENTE LA VARIABLE QUE ESTA EN LA RUTA
        V_BFILE BFILE;  -- BUSCA EL ARCHIVO PARA SABER SI EXISTE
        V_NAME_IMAGE VARCHAR(50);   -- GUARDA EL NOMBRE DE LA IMAGEN

        numero_aleatorio number;
    BEGIN
        IF (tipo_consumo = 'Local') then 
        
             INSERT INTO CONSUMO VALUES(SEQ_CONSUMO.NEXTVAL,ubicacion_var,tipo_consumo,null,fecha(fecha_var,null), id_sucursal, id_compra,id_cliente, id_mesa) ;
    
            COMMIT;
        else
            if(tipo_consumo = 'Delivery') then 
            
                INSERT INTO CONSUMO VALUES(SEQ_CONSUMO.NEXTVAL,ubicacion_var,tipo_consumo,EMPTY_BLOB(),fecha(fecha_var,null), id_sucursal, id_compra,id_cliente, null) Returning MAPA INTO V_TEMP;
            
                numero_aleatorio:=round(dbms_random.value(1, 32));
            
                V_NAME_IMAGE := numero_aleatorio||'.jpg';
        
                V_BFILE := BFILENAME('IMAGENES_CONSUMO',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE
        
                DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA
        
                DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB
        
                DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE
        
                COMMIT;
            else        --Entra aca porque es un consumo en pick-up, y la foto sera la del lugar de la sucursal
            
                INSERT INTO CONSUMO VALUES(SEQ_CONSUMO.NEXTVAL,ubicacion_var,tipo_consumo,EMPTY_BLOB(),fecha(fecha_var,null), id_sucursal, id_compra,id_cliente, null) Returning MAPA INTO V_TEMP;
            
                V_NAME_IMAGE := ubicacion_var||'.jpg';
        
                V_BFILE := BFILENAME('IMAGENES_SUCURSAL',V_NAME_IMAGE);   --SI LA IMAGEN (V_NAME_IMAGE) EXISTE EN EL DIRECTORIO (OBJETOS_LOB) SE GUARDA EN V_BFILE
        
                DBMS_LOB.OPEN(V_BFILE,DBMS_LOB.LOB_READONLY);       --LUEGO SE ABRE LA IMAGEN (V_BFILE) COMO LECTURA
        
                DBMS_LOB.LOADFROMFILE(V_TEMP,V_BFILE,DBMS_LOB.GETLENGTH(V_BFILE));      --GUARDAMOS SOBRE (V_TEMP) LA IMAGEN ENCONTRADA (V_BFILE) Y EL TAMANO EN MB O KB
        
                DBMS_LOB.CLOSE(V_BFILE);        --CERRAMOS LA VARIABLE V_BFILE
        
                COMMIT;
            
            end if;        
        end if;
    END;
END;


execute INSERTAR_CONSUMO('Las Mercedes', 'Pick-Up', 3, 10 ,null,to_date('10-NOV-22'), 1);
execute INSERTAR_CONSUMO('Las Mercedes', 'Local', 3, 10 ,null,to_date('10-NOV-22'), 1);
execute INSERTAR_CONSUMO('Las Mercedes', 'Delivery', 3, 10 ,null,to_date('10-NOV-22'), 1);
