create or replace procedure simulacion_2v (vr_id_sucursal integer)
is 
begin
    declare
        nombre_sucursal sucursal.direccion%type;
        precio_uni number;
        cant_productos integer;
        acum_sucursal number;
        cant_min integer;
        producto_name varchar(30);
        patrimonio_actual number;
        flag integer;
        cant_final number;
        vr_id_producto integer;
    begin
        
        select direccion into nombre_sucursal from sucursal where id = vr_id_sucursal;
        
        cant_productos:=round(dbms_random.value(1, 4));
        
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*--------Simulación 4:  Comprar Inventario--------*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');
        
        dbms_output.put('Se selecciono la sucursal ');        
        dbms_output.put(nombre_sucursal);
        dbms_output.put_line(' para comprar nuevo inventario');     
        
        
        dbms_output.put_line(' ');     
        dbms_output.put('Se desea comprar ');        
        dbms_output.put(cant_productos);
        dbms_output.put_line(' productos');  
        
        
        dbms_output.put_line(' ');     
        dbms_output.put_line(' ');     
        dbms_output.put_line('Debido al modelo de negocios del restaurante, solo se compraran');     
        dbms_output.put_line('productos cuando la cantidad total disponible en la sucursal, sea');     
        dbms_output.put_line('menor a la cantidad minima que requiere el producto');     

        while cant_productos > 0
        loop
            dbms_output.put_line('--------------------------------------------------------------------------------');    
            select max(id) into vr_id_producto from producto;
            vr_id_producto:=round(dbms_random.value(1, vr_id_producto));
       
            flag:=1;
            select nombre into producto_name from producto where id = vr_id_producto; --BUSCO EL NOMBRE DEL PRODUCTO
            
      
            
            select cant_minima into cant_min from producto where id = vr_id_producto; --BUSCO LA CANTIDAD MINIMA
            
            select v.acumulado.cant_acumulado into acum_sucursal --BUSCO LA CANTIDAD ACTUAL DE LA SUCURSAL
            from inventario v
            join (
                select max (id) xd
                from inventario 
                where id_sucursal = vr_id_sucursal
                and id_producto = vr_id_producto
                ) p
            on p.xd = v.id;
            
            
            if (acum_sucursal > cant_min) then --QUIERE DECIR QUE LA SUCURSAL NO NECESITA COMPRAR EL PRODUCTO
                
                dbms_output.put_line(' ');     
                dbms_output.put('Actualmente la sucursal cuenta con ');    
                dbms_output.put(acum_sucursal);    
                dbms_output.put(' del producto ');    
                dbms_output.put_line(producto_name);    
                dbms_output.put_line('Por ende no es necesario comprar este producto');    
                flag := 0;
            else
                dbms_output.put_line(' ');   
                dbms_output.put('Se procedera a evaluar si se puede comprar el producto ');   
                dbms_output.put_line(producto_name);    
                
                SELECT C.ACUMULADO.CANT_ACUMULADO INTO patrimonio_actual --EVALUO CUANTO TIENE DE PATRIMONIO
                FROM CONTABILIDAD C
                JOIN (
                    SELECT MAX(ID) ID_C 
                    FROM CONTABILIDAD
                    WHERE ID_SUCURSAL = VR_ID_SUCURSAL
                    ) P
                ON P.ID_C=C.ID;
                
                select p.precio_unitario.monto into precio_uni
                from producto p where id=vr_id_producto;
                cant_final:=precio_uni*cant_min*5;
                if (cant_final > patrimonio_actual) then
                    dbms_output.put_line(' ');   
                    dbms_output.put('Actualmente la sucursal no cuenta con el dinero suficiente para comprar ');   
                    dbms_output.put_line(producto_name); 
                    cant_final:=precio_uni*cant_min;
                    if(cant_final < patrimonio_actual) then
                        dbms_output.put_line(' ');   
                        
                    else 
                        flag:=0;        
                        dbms_output.put_line(' ');   
                        dbms_output.put('Actualmente la sucursal tampoco cuenta con el dinero suficiente para comprar ni ');   
                        dbms_output.put(cant_min); 
                        dbms_output.put(' de ');   
                        dbms_output.put_line(producto_name); 
                    end if;
                    
                end if;
   
            end if;
            
            if flag = 1 then
                
                    dbms_output.put_line('Procedo a comprar');      
                    cant_final:=cant_final/precio_uni;
                    insert into inventario values (seq_inventario.nextval, fecha((select sysdate from dual),null), cant_final,
                    acumulado(acumulado.calculate_acum(0,vr_id_sucursal,vr_id_producto,cant_final)), vr_id_producto, vr_id_sucursal);
                    dbms_output.put_line(' ');   
                    dbms_output.put('El producto ');   
                    dbms_output.put(producto_name); 
                    dbms_output.put_line(' fue comprado exitosamente.');  
                    dbms_output.put_line(' ');   
                    dbms_output.put('Total comprado: ');   
                    dbms_output.put_line(cant_final);   
                    dbms_output.put('Total pagado: ');   
                    dbms_output.put_line(cant_final*precio_uni);   
                    insert into contabilidad values (seq_contabilidad.nextval, (-1)*cant_final*precio_uni, 
                    fecha((select sysdate from dual),null), 
                    acumulado(acumulado.calculate_acum(1,vr_id_sucursal,vr_id_producto,(-1)*cant_final*precio_uni)), vr_id_sucursal);
                    commit ;
                end if;
            
            cant_productos:=cant_productos - 1;
            dbms_output.put_line(' ');    
            dbms_output.put_line('--------------------------------------------------------------------------------');            
        end loop;
        
    end;
end;