set serveroutput on
create or replace procedure simulacion_7
is
Begin

 Declare
 
    mensaje_para_mostrar varchar(200);
    
    ubicacion_nueva_sucursal varchar(20);
    descripcion_nueva_sucursal varchar(20);
    horario_nueva_sucursal varchar(20);
    
    id_sucursal_recien_insertada number;
    
    cedula_persona number;
    nombre_persona varchar(30);
    apellido_persona varchar(30);
    genero_persona varchar(3);
    telefono_persona number;
    fecha_nac_persona date;
    
    id_empleado_recien_insertado number;
    
    nombre_rol varchar(20);
    funcion_rol varchar(50);
    
    id_rol_recien_insertado number;
    
    fecha_puesto date;
    
    contador number;
    contador2 number;
    
    begin
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*--------Simulación 7: Compra de Sucursal--------*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');

        
--Aca se selecciona la ubicacion de la sucursal
        declare
           type array_t is varray(28) of varchar2(30);
           array array_t := array_t('El Hatillo', 'Carrizal', 'San Antonio','Barquisimeto', 'Catatumbo', 'Las Mercedes','San Pedro', 'El Paso', 'Valencia','Coro','Merida','Calabozo','Los Palos Grandes','Carora','Lecheria','Porlamar','Guasdualito','Los Teques','Catia La Mar', 'Cagua','Cúa','Boconó','Cabimas','Guatire','Turmero','Guanare','Valera','Maracaibo');
            numero_aleatorio number;
            
            sucursal_tomada number;
            numero_confirmacion_sucursal number;
        begin
            sucursal_tomada:=0;
            while (sucursal_tomada = 0)  
            loop
                numero_aleatorio := round(dbms_random.value(1,28)); --Se calcula con el random para seleccionar una ubicacion
                ubicacion_nueva_sucursal:=array(numero_aleatorio);-------------------------------------------------------------------------------------------------------------------OOOOOOOOOOOOOOOOOOOOO
                select count(id) into numero_confirmacion_sucursal from sucursal where direccion = ubicacion_nueva_sucursal;
                if (numero_confirmacion_sucursal = 0) then
                    mensaje_para_mostrar := 'La ubicacion de la nueva sucursal será en ' || ubicacion_nueva_sucursal ;
                    dbms_output.put_line(mensaje_para_mostrar);    
                    dbms_output.put_line('Ahora se empezará la configuración de los atributos de esta sucursal'); 
                    dbms_output.put_line('------------------------------------------------------------------------');
                    sucursal_tomada := 1;
                else
                    mensaje_para_mostrar := 'ERROR -> La ubicacion seleccionada( ' || ubicacion_nueva_sucursal || ' ) ya esta en nuestra base de datos';
                    dbms_output.put_line(mensaje_para_mostrar);    
                    dbms_output.put_line('Se procederá a comprar otra sucursal en otra dirección'); 
                    dbms_output.put_line('------------------------------------------------------------------------');
                end if;
            end loop;
        end;  
        
        
--Aca se selecciona la descripcion de la sucursal
        declare   --LA ___________  comida
           type array_t is varray(9) of varchar2(30);
           array array_t := array_t('mejor experiencia en', 'máxima calidad en', 'suprema calidad en','salud en', 'calidad en', 'exquisita','suculenta', 'magnifica', 'deliciosa');
            numero_aleatorio number;
        begin
            numero_aleatorio := round(dbms_random.value(1,9)); --Se calcula con el random para seleccionar una descripcion
            descripcion_nueva_sucursal:=array(numero_aleatorio);
        end;
        
--Aca se selecciona el horario de la sucursal
        declare  
           type array_t is varray(9) of varchar2(30);
           array array_t := array_t('9am-9pm', '10am-10pm', '11am-11pm','12am-12pm', '1pm-1am', '2pm-2am','3pm-3am', '4pm-4am', '5pm-5am');
            numero_aleatorio number;
        begin
            numero_aleatorio := round(dbms_random.value(1,9)); --Se calcula con el random para seleccionar una descripcion
            horario_nueva_sucursal:=array(numero_aleatorio);
        end;

--Mostramos la inserción de la sucursal 

        dbms_output.put_line('LISTO...Ahora se hará la inserción de la nueva sucursal');  
        dbms_output.put_line('------------------------------------------------------------------------');

       INSERTAR_SUCURSALES(ubicacion_nueva_sucursal, descripcion_nueva_sucursal , horario_nueva_sucursal );
       --Guardamos el id de esta ultima sucursal
       select max(id) into id_sucursal_recien_insertada from sucursal;
       
        mensaje_para_mostrar:= 'Información de la sucursal de ' || ubicacion_nueva_sucursal || ' de id ' || id_sucursal_recien_insertada;
        dbms_output.put_line(mensaje_para_mostrar);    
        mensaje_para_mostrar:= 'Descripción -> La ' || descripcion_nueva_sucursal || ' comida ';
        dbms_output.put_line(mensaje_para_mostrar);    
        mensaje_para_mostrar:= 'Horario -> ' || horario_nueva_sucursal ;
        dbms_output.put_line(mensaje_para_mostrar);    
        dbms_output.put_line('Ahora se le asignaran a la sucursal los empleados con sus roles'); 
        dbms_output.put_line('------------------------------------------------------------------------');
        
        mensaje_para_mostrar:= 'Acontinuacion de presentan 3 empleados creados para la nueva sucural de ' || ubicacion_nueva_sucursal || ':';
        dbms_output.put_line(mensaje_para_mostrar);  
        mensaje_para_mostrar:= '                         ';
        dbms_output.put_line(mensaje_para_mostrar);  

-- Creación de personas, empleados
       contador:=3;
       contador2:=1;
        while (contador != 0 ) 
        loop
            --Calculo de la cedula
            declare 
                hay_cedula number;
                sale_while number;
            begin
                sale_while := 0;
                while (sale_while != 1)
                loop
                    cedula_persona := round(dbms_random.value(10000000,99999999));
                    select count(cedula) into hay_cedula from persona where cedula = cedula_persona;
                    if (hay_cedula = 0) then 
                        sale_while := 1;
                    end if;
                end loop;
            end;

            --Creación del nombre
            declare 
               type array_t is varray(41) of varchar2(30);
               array array_t := array_t('Angel', 'Maria', 'Gabriel','Joely', 'Juan', 'Jose','Manolo', 'Marcos', 'Elon','Miguel', 'Marta', 'Javier','Alejandro', 'Simon', 'Carlos','Martin', 'Jacobo', '	Jacinto','Alan', 'Andres', 'Marta','Julia', 'Paula', 'Noelia','Belen', 'Bolivar', 'Julia','Patricio', 'Paul', 'Matilda','Celeste', 'Simeone', 'Felicidad','Jolie', 'Victoria', 'Nicolas','Zulema','Nilo','Gustavo','Gonzalo','Victor');
                numero_aleatorio number;
            begin
                numero_aleatorio := round(dbms_random.value(1,41));
                nombre_persona:=array(numero_aleatorio);
            end;
            
            --Creación del apellido
            declare 
               type array_t is varray(41) of varchar2(30);
               array array_t := array_t('García', 'Rodríguez', 'González','Fernández', 'López', 'Martínez','Sánchez', 'Pérez', 'Gómez','Jiménez', 'Hernández', 'Ruiz','Díaz', 'Moreno', 'Muñoz','Álvarez', 'Marchell', 'Marci','Macanas', 'Marcott', 'Zúñiga','Ayala', 'Valenzuela', 'Orozco','Cárdenas', 'Aguirre', 'Espinosa','Padilla', 'Meza', 'Huerta','Fuentes', 'Molina', 'Robles','Pacheco', 'Nava', 'Valencia','Cabrera','Pea','Miranda','Acosta','Navarro');
                numero_aleatorio number;
            begin
                numero_aleatorio := round(dbms_random.value(1,41)); 
                apellido_persona:=array(numero_aleatorio);
            end;
            
            --Creación del genero
            declare 
               type array_t is varray(41) of varchar2(30);
               array array_t := array_t('M','F','N/A');
                numero_aleatorio number;
            begin
                numero_aleatorio := round(dbms_random.value(1,3)); 
                genero_persona:=array(numero_aleatorio);
            end;
            
           --Creación del telefono
            declare 
                hay_telefono number;
                sale_while number;
            begin
                sale_while := 0;
                while (sale_while != 1)
                loop
                    telefono_persona := round(dbms_random.value(10000000000,99999999999));
                    select count(telefono) into hay_telefono from persona where telefono = telefono_persona;
                    if (hay_telefono = 0) then 
                        sale_while := 1;
                    end if;
                end loop;
            end;
            
            --Creacion de la fecha de nacimiento
            select sysdate-round(dbms_random.value(100000,1000000),0) into fecha_nac_persona from dual; 
            
            
            --Insertamos la nueva persona
            
            insert into persona values (cedula_persona, nombre_persona, apellido_persona, genero_persona, telefono_persona, fecha_nac_persona, 0, 1);
            
            --Ahora se hace la creacion del empleado
    
            INSERTAR_EMPLEADO(cedula_persona, id_sucursal_recien_insertada);
            
            --Guardamos el id del ultimo empleado agregado
            select id into id_empleado_recien_insertado from empleado where id_persona = cedula_persona;
            
        --Creacion del rol 
            
            --Creación del nombre del rol
            declare 
               type array_t is varray(12) of varchar2(30);
               array array_t := array_t('Gerente', 'Administrador', 'Personal de cocina','Encargado de compras', 'Sous-chef', 'Cocineros','Mesonero','Personal del bar','Recepcionista','Personal de sala','Equipo de limpieza','Chef de estación');
                numero_aleatorio number;
                
                rol_agregado_anteriormente number;
                salir_while number;
                
                funcion_rol varchar(50);
                monto_var number;
            begin
                salir_while := 0;
                while (salir_while != 1)
                loop
                    numero_aleatorio := round(dbms_random.value(1,12));
                    nombre_rol:=array(numero_aleatorio);
                    
                    select count(id) into rol_agregado_anteriormente from rol where nombre = nombre_rol;
                    
                    if(rol_agregado_anteriormente != 0) then
                        salir_while := 1;
                    else 
                        monto_var := round(dbms_random.value(40,200));
                        funcion_rol := 'Lo que hace ' || nombre_rol;
                        if(nombre_rol = 'Gerente' or nombre_rol = 'Administrador' or nombre_rol = 'Sous-chef') then
                            insert into rol values (SEQ_ROL.NEXTVAL, nombre_rol, funcion_rol,monto(monto_var,'$'), 1);
                            salir_while := 1;
                        else 
                            insert into rol values (SEQ_ROL.NEXTVAL, nombre_rol, funcion_rol,monto(monto_var,'$'), 0);
                            salir_while := 1;
                        end if;
                    end if;
                    select id into id_rol_recien_insertado from rol where nombre = nombre_rol;
                end loop;
            end;  
            
            
            mensaje_para_mostrar:= 'Empleado N-'||contador2;
            dbms_output.put_line(mensaje_para_mostrar);  
            mensaje_para_mostrar:= '    Nombre -> ' || nombre_persona || ' || Apellido -> ' || apellido_persona || ' || Cedula -> ' || cedula_persona || ' || Genero -> ' || genero_persona || ' || Telefono -> ' || telefono_persona || ' || Fecha nac -> ' || fecha_nac_persona || ' || Rol -> ' || nombre_rol ;
            dbms_output.put_line(mensaje_para_mostrar);  
            dbms_output.put_line('');

            contador:=contador-1;
            contador2:=contador2+1;
            
            --Creacion del puesto     
            select sysdate into fecha_puesto from dual;
            insert into puesto values (SEQ_PUESTO.NEXTVAL,fecha(fecha_puesto,fecha_puesto),id_sucursal_recien_insertada,id_empleado_recien_insertado,id_rol_recien_insertado);
            
        end loop;
        dbms_output.put_line('------------------------------------------------------------------------');
        mensaje_para_mostrar:= 'Como último paso, se hizo el llenado de la tabla Puesto, relacionando a los empleados con sus respectivos roles y con su respectiva sucursal de ' || ubicacion_nueva_sucursal ;
        dbms_output.put_line(mensaje_para_mostrar);  
        dbms_output.put_line('------------------------------------------------------------------------');
    end; 
end;