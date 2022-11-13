set serveroutput on
create or replace procedure simulacion_3 
is
Begin
    Declare
        cantidad_sucursales number;
        id_sucursal_aleatoria number;
        ubicacion_sucursal varchar(30);
        
        fecha_aleatoria date;
        fecha_tomada number;
        
        nombre_grupo varchar(30);
        grupo_guardado number;
        descripcion_grupo varchar(100);
        id_grupo_ya_registrado number;
        
        nombre_evento varchar(100);
        condiciones_evento varchar(1000);
        
        mensaje_para_mostrar varchar(200);
    
    begin
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*--------Simulación 3: Contratación de Grupo--------*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');
    
        select count(id)into cantidad_sucursales from sucursal;             --Guarda la cantidad de sucursales que estan guardadas en la base de datos
        id_sucursal_aleatoria := round(dbms_random.value(1,cantidad_sucursales)); --Se calcula con el random para el id de la sucursal
        declare
            cursor sucursalC is 
            select * from sucursal suc
            where suc.id = id_sucursal_aleatoria;
            registro_sucursal sucursal%rowtype;
        begin 
            open sucursalC;
            fetch sucursalC into registro_sucursal;
            close sucursalC;
            ubicacion_sucursal :=registro_sucursal.direccion;
            mensaje_para_mostrar := 'Se registrará un evento en la sucursal de ' || ubicacion_sucursal;
            dbms_output.put_line(mensaje_para_mostrar);
            dbms_output.put_line('------------------------------------------------------------------------');
        end;
        
        select sysdate-round(dbms_random.value(0,60),0) into fecha_aleatoria from dual; --fecha aleatoria.
        
        mensaje_para_mostrar := 'La fecha propuesta para el evento es -> ' || fecha_aleatoria;
        dbms_output.put_line(mensaje_para_mostrar);
        dbms_output.put_line('------------------------------------------------------------------------');
        
        fecha_tomada := 0;
        
        select count(event.id) into fecha_tomada from evento event
--        where event.id_sucursal = 1 and event.fecha_evento.FECHA_INICIO = '16-OCT-22' ;
        where event.id_sucursal = id_sucursal_aleatoria and event.fecha_evento.FECHA_INICIO = fecha_aleatoria ;
    
        if (fecha_tomada = 0) then 
            mensaje_para_mostrar := 'La sucursal de ' || ubicacion_sucursal || ' no posee ningún evento para la fecha ' || fecha_aleatoria;
            dbms_output.put_line(mensaje_para_mostrar);    
            dbms_output.put_line('Por lo tanto se procederá a asignar el evento con su grupo'); 
            dbms_output.put_line('------------------------------------------------------------------------');
            
--Aca sera seeccionado el nombre del grupo para el evento
            declare
               type array_t is varray(15) of varchar2(30);
               array array_t := array_t('Los comicos', 'Los Mesoneros', 'Anakena','Imagine Dragons', 'La Bichona', 'Bad Bunny','Post Malone', 'Los Pericos', 'Carlos Vives', 'Franco de Vita','Iron Maiden','The Ramones','Guns N Roses','Led Zeppelin','Los parranderos');
                numero_aleatorio_grupos number;
            begin
--               for i in 1..array.count loop
--                   dbms_output.put_line(array(i));
--               end loop;
                numero_aleatorio_grupos := round(dbms_random.value(1,15)); --Se calcula con el random para seleccionar un nombre de grupo
                nombre_grupo:=array(numero_aleatorio_grupos);
            
                mensaje_para_mostrar := 'El grupo para el evento en la sucursal de' || ubicacion_sucursal || ' será -> ' || nombre_grupo;
                dbms_output.put_line(mensaje_para_mostrar);    
                dbms_output.put_line('Por lo tanto se procederá a verificar que el grupo no se encuentre guardado anteriormente en la base de datos'); 
                dbms_output.put_line('------------------------------------------------------------------------');
            end;
            
--Aca se selecciona la descripcion del grupo
            declare 
                type array_t is varray(15) of varchar2(30);
                array array_t := array_t('Música clásica', 'Música Electrónica', 'Regueton','Jazz', 'Opera', 'LowFi','Merengue', 'Ballenato', 'Gaitas', 'Música llanera','Música country','Rock pesado','Bachata','Electro','Pop');
                numero_aleatorio_descripcion number;
            
            begin 
                numero_aleatorio_descripcion := round(dbms_random.value(1,15)); --Se calcula con el random para seleccionar una descripcion de grupo
                descripcion_grupo:=array(numero_aleatorio_descripcion);
            end;
            
            select count(id) into grupo_guardado from grupo gru
            where gru.nombre = nombre_grupo;
--            grupo_guardado:=1;
            if(grupo_guardado = 0) then 
            
                mensaje_para_mostrar := 'El grupo ' || nombre_grupo || ' de '|| descripcion_grupo || ' no se encuentra registrado en nuestra base de datos, se procederá a registrar';
                dbms_output.put_line(mensaje_para_mostrar);    
                dbms_output.put_line('------------------------------------------------------------------------');
                
            --En este punto se agrego el el grupo
                  insert into grupo values(SEQ_GRUPO.nextval, nombre_grupo, descripcion_grupo);         --ACA HACE INSERCION DELL GURPO NUEVO
            else

                mensaje_para_mostrar := 'El grupo ' || nombre_grupo || ' ya se encuentra registrado en la base de datos, no se procederá a guardar por segunda vez';
                dbms_output.put_line(mensaje_para_mostrar);    
                dbms_output.put_line('------------------------------------------------------------------------');
            
            end if;
            
--Aca asignamos el grupo al evento 
            if (grupo_guardado = 0) then
            
                select gru2.id into id_grupo_ya_registrado  from grupo gru2 where gru2.nombre = nombre_grupo;
                
                select gru3.descripcion into descripcion_grupo from grupo gru3 where gru3.id = id_grupo_ya_registrado;

                nombre_evento := 'Mix '||descripcion_grupo||' de '||nombre_grupo;     
                
                condiciones_evento := 'Mucha '||descripcion_grupo||' de calidad';
        
            --En este punto se agrego el evento a la base se datos con el grupo y la sucursal
                insert into evento values (seq_evento.nextval,nombre_evento, condiciones_evento, 10, 14, fecha(fecha_aleatoria, fecha_aleatoria), id_grupo_ya_registrado, id_sucursal_aleatoria);

                mensaje_para_mostrar := 'Se le asigno a la sucursal de ' || ubicacion_sucursal || ' el evento '|| nombre_evento || ' en la fecha ' || fecha_aleatoria;
                dbms_output.put_line(mensaje_para_mostrar);    
                dbms_output.put_line('------------------------------------------------------------------------');
                
            else

                select gru2.id into id_grupo_ya_registrado  from grupo gru2 where gru2.nombre = nombre_grupo;
                
                select gru3.descripcion into descripcion_grupo from grupo gru3 where gru3.id = id_grupo_ya_registrado;
                
                nombre_evento := 'Mix '||descripcion_grupo||' de '||nombre_grupo;     
                
                condiciones_evento := 'Mucha '||descripcion_grupo||' de calidad';
            
               insert into evento values (seq_evento.nextval,nombre_evento, condiciones_evento, 10, 14, fecha(fecha_aleatoria, fecha_aleatoria), id_grupo_ya_registrado, id_sucursal_aleatoria);
              
                mensaje_para_mostrar := 'Se le asigno a la sucursal de ' || ubicacion_sucursal || ' el evento '|| nombre_evento || ' en la fecha ' || fecha_aleatoria;
                dbms_output.put_line(mensaje_para_mostrar);    
                dbms_output.put_line('------------------------------------------------------------------------');
              
            end if;
                
        else
            mensaje_para_mostrar := 'La sucursal de ' || ubicacion_sucursal || ' ya tiene un evento para la fecha ' || fecha_aleatoria;
            dbms_output.put_line(mensaje_para_mostrar);    
            dbms_output.put_line('Por lo tanto no se podra asignar el evento.'); 
            dbms_output.put_line('------------------------------------------------------------------------');
        
        end if;
        
    end; 
end;  
