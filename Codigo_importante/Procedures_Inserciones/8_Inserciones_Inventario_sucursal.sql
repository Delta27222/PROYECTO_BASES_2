
create or replace procedure INSERTAR_PRODUCTOS_EN_INVENTARIO(id_sucursal number)
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
            select cant_minima into cantidad_producto from producto where id = iterador; 
            if(id_sucursal = 1) then
                if(iterador = 21) then --Es chocolate
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 29) then  --Es vainilla
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if(iterador = 37) then   --Es Papa
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if(iterador = 47) then    --Es papelon
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if (iterador != 21 and iterador != 29 and iterador != 37 and iterador != 47) then 
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
                end if;           
            end if;
            if(id_sucursal = 2) then
                if(iterador = 3) then --Es Arroz
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 4) then  --Es Pasta
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if(iterador = 9) then   --Es Parmesano
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if (iterador != 3 and iterador != 4 and iterador != 9) then 
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
                end if;           
            end if;
            if(id_sucursal = 3) then
                if(iterador = 5) then --Es Queso
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 16) then  --Es Mejillones
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if(iterador = 23) then   --Es Azucar
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if(iterador = 30) then    --Es Pimenton
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if (iterador != 5 and iterador != 16 and iterador != 23 and iterador != 30) then 
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
                end if;           
            end if;
            if(id_sucursal = 4) then
                if(iterador = 10) then --Es Jamon
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 12) then  --Es Anchoas
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-5,ACUMULADO(cantidad_producto-5), iterador,id_sucursal);
                end if;
                if(iterador = 11) then   --Es Salchichon
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 13) then    --Es Pimenton
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-4,ACUMULADO(cantidad_producto-4), iterador,id_sucursal);
                end if;
                if (iterador != 10 and iterador != 11 and iterador != 12 and iterador != 13) then 
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
                end if;           
            end if;
            if(id_sucursal = 5) then
                if(iterador = 33) then --Es Aji Dulce
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-3,ACUMULADO(cantidad_producto-3), iterador,id_sucursal);
                end if;
                if(iterador = 39) then  --Es Tomate
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 41) then   --Es Calabacin
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 42) then    --Es Vainitas
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if (iterador != 33 and iterador != 39 and iterador != 41 and iterador != 42) then 
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
                end if;           
            end if;
            if(id_sucursal = 6) then
                if(iterador = 49) then --Es Agua
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 50) then  --Es Pan
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 51) then   --Es Pollo
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-2,ACUMULADO(cantidad_producto-2), iterador,id_sucursal);
                end if;
                if(iterador = 42) then    --Es Vainitas
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto-1,ACUMULADO(cantidad_producto-1), iterador,id_sucursal);
                end if;
                if (iterador != 49 and iterador != 50 and iterador != 51 and iterador != 42) then 
                    insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
                end if;           
            end if;
            
            if (id_sucursal != 1 or id_sucursal != 2 or id_sucursal != 3 or id_sucursal != 4 or id_sucursal != 5 or id_sucursal != 6) then 
                insert into inventario VALUES(SEQ_INVENTARIO.nextval, fecha(fecha_inventario,NULL),cantidad_producto,ACUMULADO(cantidad_producto), iterador,id_sucursal);
            end if;
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

