create or replace NONEDITIONABLE procedure INSERTAR_PRODUCTOS_EN_INVENTARIO(id_sucursal number)
is 
Begin
    DECLARE
        cantidad_producto number;

        fecha_inventario date;

        iterador number; 

        es_par number;
    BEGIN
        iterador := 1;
        select sysdate-round(0,0) into fecha_inventario from dual; --fecha aleatoria entre 8 dias.

        while (iterador != 52)  
        loop 
            
            es_par:=round(dbms_random.value(1, 2));
            select cant_minima into cantidad_producto from producto where id = iterador;

            IF (MOD(es_par,2) = 1) THEN 
                DBMS_OUTPUT.PUT_LINE('ES impar');
                insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
            ELSE
                DBMS_OUTPUT.PUT_LINE('ES par');
                insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
            END IF;
        
            iterador :=1+ iterador;
        end loop;
    END;
end;

execute INSERTAR_PRODUCTOS_EN_INVENTARIO(1);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(2);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(3);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(4);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(5);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(6);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(7);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(8);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(9);
execute INSERTAR_PRODUCTOS_EN_INVENTARIO(10);

