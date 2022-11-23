create or replace procedure simulacion_4 
is
begin
    declare
        TYPE platos_a_consumir
        IS TABLE OF varchar(20)
        INDEX BY PLS_INTEGER;
        
        el_plato platos_a_consumir;
        cant_consumos integer;
        cont integer;
        cont2 integer;
        cant_platos integer;
        total_platos integer;
        vr_id_plato integer;
        tipo_consumo integer;
        sr_tipo_consumo consumo.tipo%type;
        flag integer;
        vr_id_consumo integer;
        cant_pago number;
        vr_id_sucursal integer;
        vr_sucursal varchar(50);
        vr_id_cliente integer;
        vr_cliente varchar(50);
        cant_mesas integer;
        cant_personas integer;
        fecha_hoy date;
        type array_t is varray(8) of varchar2(30);
           array array_t := array_t('El Paso', 'Los Teques', 'Los Palos Grandes', 'mapa_suc_1', 'mapa_suc_3', 'Las Mercedes', 'Cabimas','Catia La Mar');
    begin
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*-----Simulación 4: Realizar Consumo-----*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');
        
        cont:=1;
        
        cant_consumos:=round(dbms_random.value(2, 6)); --SELECCIONO LA CANTIDAD DE CONSUMOS A REALIZAR
        
        select max(id) into vr_id_sucursal from sucursal;
        vr_id_sucursal:= round(dbms_random.value(2, vr_id_sucursal));  --SELECCIONO UNA SUCURSAL ALEATORIA
        select direccion into vr_sucursal from sucursal where id = vr_id_sucursal;
        
   
        dbms_output.put_line('*-*-*-*-*-*-----SUCURSAL: '||vr_sucursal||'-----*-*-*-*-*-*');   
        
        
        while (cont<=cant_consumos)
        loop
            
            select max(id) into vr_id_cliente from persona;
            vr_id_cliente:= round(dbms_random.value(2, vr_id_cliente));  --SELECCIONO UN cliente ALEATORIA
            select nombre into vr_cliente from persona where id = vr_id_cliente;
            cant_pago:=0;
            cant_personas:=round(dbms_random.value(2, 12));
            dbms_output.put_line('------------------------------------------------------------------------');
            dbms_output.put_line('------------------------------------------------------------------------');
            dbms_output.put_line(cont||'- El cliente: '||vr_cliente||' solicito un consumo de '||cant_personas||' personas');
            cant_platos:=cant_personas +round(dbms_random.value(2, 4));  --SELECCIONO LA CANTIDAD DE PLATOS A REGISTRAR DE ESTE CONSUMO
            select max(id) into total_platos from plato;
            cont2:=1;
            dbms_output.put_line('con '||cant_platos||' platos.');
            dbms_output.put_line('                                                                        ');
            while(cont2<=cant_platos)
            loop
                vr_id_plato:=round(dbms_random.value(1, total_platos));
                select nombre into el_plato(cont2) from plato
                where id = vr_id_plato;
                cont2:=cont2+1;
            end loop;
            dbms_output.put_line('-------------------------');
            dbms_output.put_line('Cantidad de platos: '||cant_platos);
            dbms_output.put_line('-------------------------');
            dbms_output.put_line(' ');
             FOR i IN el_plato.FIRST..el_plato.LAST 
             LOOP
              IF el_plato.EXISTS(i) THEN
                DBMS_OUTPUT.PUT_LINE(i||'. Nombre plato: '||el_plato(i));
              ELSE
                DBMS_OUTPUT.PUT_LINE('Indice: '||i||' no asignado');
              END IF;
             END LOOP;
            
            
            tipo_consumo:=round(dbms_random.value(1,5));
    
           dbms_output.put_line(' ');
           if (tipo_consumo = 2) then sr_tipo_consumo:= 'Delivery';
           else if (tipo_consumo = 3) then sr_tipo_consumo:= 'Pick-Up';
           else sr_tipo_consumo:= 'Local';
           end if;
           end if;
       
            
            FOR i IN el_plato.FIRST..el_plato.LAST 
             LOOP
              IF el_plato.EXISTS(i) THEN
                select p.precio.monto into cont2
                from plato p where nombre = el_plato(i);
                cant_pago:= cant_pago + cont2;
              END IF;
             END LOOP;

            if (tipo_consumo = 2 or tipo_consumo = 3) then 
                dbms_output.put_line('En la sucursal '||vr_sucursal||' se ha solicitado un pedido de tipo '||sr_tipo_consumo);
                flag :=1;

            else

                dbms_output.put_line('En la sucursal '||vr_sucursal||' se ha solicitado un consumo para comer en el local');
                select count(id) into cont2 from mesa where id_sucursal = vr_id_sucursal and cant_puestos>=cant_personas;
                 if cont2 = 0 then
                    dbms_output.put_line(' ');
                    dbms_output.put_line('Disculpe, actualmente en la sucursal '||vr_sucursal||' no se encuentran mesas disponibles');
                    dbms_output.put_line('Solo se admiten deliverys o pick-ups');
                    tipo_consumo :=2;
                 end if;
            end if;

            tipo_consumo := round(dbms_random.value(1,8));
             simulacion_8(cant_pago, vr_id_sucursal,vr_id_cliente);
--             commit ;
             select max(id) into cont2 from compra;
             select sysdate into fecha_hoy from dual;
             insertar_consumo(array(tipo_consumo), sr_tipo_consumo, vr_id_cliente, vr_id_sucursal, cont2, fecha_hoy, 2);
            

            select max(id) into vr_id_consumo from consumo;
            
            FOR j IN el_plato.FIRST..el_plato.LAST 
             LOOP
              IF el_plato.EXISTS(j) THEN
                select id into cont2 from plato where nombre = el_plato(j); 
                insert into plato_consumido values (seq_plato_consumido.nextval, cont2, vr_id_consumo);
                
                dbms_output.put_line('Inserto '||el_plato(j));
                
              END IF;
             END LOOP;
            
            dbms_output.put_line('------------------------------------------------------------------------');
            dbms_output.put_line('------------------------------------------------------------------------');
            dbms_output.put_line(' ');
            
            cont:=cont+1;
            el_plato.delete();
        end loop;
    end;
end;

--execute simulacion_4();