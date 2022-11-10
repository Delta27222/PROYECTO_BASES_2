DECLARE
    --CREACION DEL CURSOR
    CURSOR cvalores IS 
        select * from Billetera;
    --CREACION DEL CURSOR

    --VARIABLE DE TIPO ROW
    REGISTRO_TABLA Billetera%rowtype;
    --VARIABLE DE TIPO ROW
    
    --VARIABLE NORMAL
    VARIABLE NUMBER;
    --VARIABLE NORMAL
    
BEGIN 
    OPEN cvalores;
        VARIABLE := 0; 
        FETCH cvalores INTO REGISTRO_TABLA;
        WHILE cvalores%FOUND
            LOOP
--            dbms_output.put_line(REGISTRO_TABLA.ID);
                
                VARIABLE := VARIABLE + REGISTRO_TABLA.CONSUMO;
--                INSERT INTO BILLETERA_ACUMULADO VALUES (RESGISTRO_TABLA.id, RESGITRO_TABLA.consumo, VARIABLE);  TENGO PROBLEMAS CON ESTE INSERT-NO ME DEJA INSERTAR
                FETCH cvalores INTO REGISTRO_TABLA;  
            
            END LOOP;
    CLOSE cvalores;
END;


--CON ESTO PODRE VER LOS VALORES DE LOS CONSUMOS
declare
    v_valor billetera.consumo%type;
    CURSOR cvalores IS 
        select consumo from Billetera;
begin

    open cvalores;
        loop
            fetch cvalores into v_valor;
            
            exit when cvalores%notfound;
            
            dbms_output.put_line(v_valor);
        
        end loop;
    close cvalores;
end;


-- EJERCICIO DE PRACTICA QUE PUSO EL PROFESOR EN LA PIZARRA
set serverout on;

declare 
    --CREACION DEL CURSOR
        --GENERAL
        CURSOR all_cursor IS 
            select * from inventario;
        --FECHA
        CURSOR fecha_cursor IS 
            select fecha from inventario
            order by fecha DESC;
            
        --SUCURSAL
        CURSOR sucursal_cursor IS 
            select sucursal from inventario;
            
        --PRODUCTO
        CURSOR producto_cursor IS 
            select producto from inventario;
    --CREACION DEL CURSOR
    
    --VARIABLE PARA LAS COSAS
        v_fecha inventario.fecha%type;
        v_sucursal inventario.sucursal%type;
        v_producto inventario.producto%type;
    --VARIABLE PARA LAS COSAS

    --VARIABLE DE TIPO ROW
        REGISTRO_TABLA Inventario%rowtype;
    --VARIABLE DE TIPO ROW
    
    --VARIABLE NORMAL
        VARIABLE NUMBER;
        SALIR NUMBER;
    --VARIABLE NORMAL

begin 
    SALIR:=0;
    OPEN fecha_cursor;
    fetch fecha_cursor into v_fecha;
    WHILE fecha_cursor%FOUND
        LOOP
--            dbms_output.put_line('Fecha V');  
--            dbms_output.put_line(v_fecha);
            
            OPEN sucursal_cursor;
            fetch sucursal_cursor into v_sucursal;
            WHILE sucursal_cursor%FOUND
                LOOP 
--                    dbms_output.put_line('Sucursal V');  
--                    dbms_output.put_line(v_sucursal);  
                
                    OPEN producto_cursor;
                    fetch producto_cursor into v_producto;
                    WHILE producto_cursor%FOUND
                        LOOP 
--                            dbms_output.put_line('Producto V');  
--                            dbms_output.put_line(v_producto);  
                            
                            OPEN all_cursor;
                            fetch all_cursor into REGISTRO_TABLA;
                            WHILE (all_cursor%FOUND) OR (SALIR = 1)
                                LOOP
                                    IF (REGISTRO_TABLA.fecha=v_fecha) and (REGISTRO_TABLA.sucursal=v_sucursal) and (REGISTRO_TABLA.producto=v_producto)THEN 
                                       dbms_output.put_line(v_fecha);
                                       dbms_output.put_line(v_sucursal);  
                                       dbms_output.put_line(v_producto);
                                       dbms_output.put_line('------------------------------'); 
                                       SALIR:=1;
                                    END IF;
                                fetch all_cursor into REGISTRO_TABLA;
                                EXIT WHEN SALIR = 1;
                                END LOOP;
                            SALIR:=0;
                            CLOSE all_cursor;
                            fetch producto_cursor into v_producto;
                
                        END LOOP;
                    CLOSE producto_cursor;
                    fetch sucursal_cursor into v_sucursal;
                END LOOP;
            CLOSE sucursal_cursor;
            fetch fecha_cursor into v_fecha;  
        end LOOP;
    CLOSE fecha_cursor;
end;






create table inventario(
    id number primary key,
    fecha date, 
    sucursal varchar(30),
    producto varchar(30),
    cantidad number, 
    precio number,
    total_acumulado number
)


insert into inventario values(2,TO_DATE('2022/10/14', 'yyyy/mm/dd'),'Altamira','Carne',2,10,0);
insert into inventario values(3,TO_DATE('2022/10/15', 'yyyy/mm/dd'),'Las Mercedes','Carne',1,10,0);
insert into inventario values(4,TO_DATE('2022/10/16', 'yyyy/mm/dd'),'Altamira','Tomate',5,20,0);
insert into inventario values(5,TO_DATE('2022/10/17', 'yyyy/mm/dd'),'Altamira','Carne',2,10,0);















--verrrrr estooooooooooooooooooooooooooooooooooooooooooo









-- EJERCICIO DE PRACTICA QUE PUSO EL PROFESOR EN LA PIZARRA
set serverout on;

declare 
    --CREACION DEL CURSOR
        --GENERAL
        CURSOR all_cursor IS 
            select * from inventario;
        --FECHA
        CURSOR fecha_cursor IS 
            select fecha from inventario
            order by fecha DESC;
            
        --SUCURSAL
        CURSOR sucursal_cursor IS 
            select sucursal from inventario;
            
        --PRODUCTO
        CURSOR producto_cursor IS 
            select producto from inventario;
    --CREACION DEL CURSOR
    
    --VARIABLE PARA LAS COSAS
        v_fecha inventario.fecha%type;
        v_sucursal inventario.sucursal%type;
        v_producto inventario.producto%type;
    --VARIABLE PARA LAS COSAS

    --VARIABLE DE TIPO ROW
        REGISTRO_TABLA Inventario%rowtype;
    --VARIABLE DE TIPO ROW
    
    --VARIABLE NORMAL
        VARIABLE NUMBER;
        SALIR NUMBER;
    --VARIABLE NORMAL

begin

    OPEN sucursal_cursor;
    fetch sucursal_cursor into v_sucursal;
    WHILE (sucursal_cursor%FOUND)
        LOOP

            OPEN producto_cursor ;
            fetch producto_cursor into v_producto;
            WHILE (producto_cursor%FOUND)
                LOOP

                    OPEN all_cursor;
                    fetch all_cursor into REGISTRO_TABLA;
                    WHILE (all_cursor%FOUND)
                        LOOP
                        
                        IF (REGISTRO_TABLA.sucursal = v_sucursal)then 
                            dbms_output.put_line(REGISTRO_TABLA.sucursal);
                        
                        END IF;
            
                        fetch all_cursor into REGISTRO_TABLA;
                        END LOOP;
                    CLOSE all_cursor;

                fetch producto_cursor into v_producto;
                END  LOOP ;
            CLOSE producto_cursor;

        fetch sucursal_cursor into v_sucursal;
        END LOOP;
    CLOSE sucursal_cursor;

end;