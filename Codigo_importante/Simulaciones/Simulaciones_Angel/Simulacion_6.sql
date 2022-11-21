create or replace NONEDITIONABLE procedure simulacion_6
is
Begin

 Declare

    mensaje_para_mostrar varchar(200);

    id_sucursal_aleatoria number;
    direccion_sucursal varchar(30);

    id_rol_aleatorio number;
    nombre_rol varchar(30);

    cedula_persona number;
    nombre_persona varchar(30);
    apellido_persona varchar(30);
    genero_persona varchar(3);
    telefono_persona number;
    fecha_nac_persona date;

    id_persona_recien_agregada  number;

    id_empleado_recien_insertado number;

    rol_unico number;

    puesto_con_rol_en_sucursal number;

    despedir_o_nuevo_rol number;

    id_rol_nuevo number;

    entra_a_if_final number;

    id_empleado_a_despedir number;

    id_puesto_var number;

    numero_suma number;

    fecha_puesto date;
    
    numero_grande number;

    nombre_rol_nuevo varchar(30);

    begin
        entra_a_if_final := 0;

        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*-----Simulación 6: Contratacion de personal-----*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');


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
        insert into persona values (SEQ_PERSONA.NEXTVAL,cedula_persona, nombre_persona, apellido_persona, genero_persona, telefono_persona, fecha_nac_persona, 0, 1);

        --insert into persona values (9999,cedula_persona, nombre_persona, apellido_persona, genero_persona, telefono_persona, fecha_nac_persona, 0, 1);
        --id_persona_recien_agregada := 9999;
        --Guardamos el id de la ultima persona agregada
        --select id into id_persona_recien_agregada from persona where cedula = cedula_persona;

        mensaje_para_mostrar:= 'Datos del nuevo empleado:';
        dbms_output.put_line(mensaje_para_mostrar);  
        mensaje_para_mostrar:= '    Nombre -> ' || nombre_persona || ' || Apellido -> ' || apellido_persona || ' || Cedula -> ' || cedula_persona || ' || Genero -> ' || genero_persona || ' || Telefono -> ' || telefono_persona || ' || Fecha nac -> ' || fecha_nac_persona ;
        dbms_output.put_line(mensaje_para_mostrar);  
        dbms_output.put_line('  ');
        mensaje_para_mostrar:= 'Ahora se procedera a seleccionar la sucursal, y el rol para la asignacion.';
        dbms_output.put_line(mensaje_para_mostrar);  
        dbms_output.put_line('----------------------------------------------------------------------------');

        --seleccionamos ;a sucursal aleatoria-=----------------------------------------------------------------------------------------------------------------------------aca da error, nmo consigue la sucursal
        
        select max(id) into id_sucursal_aleatoria from sucursal;   --Selecciono la sucursal de la reserva, aleatoriamente
        id_sucursal_aleatoria := round(dbms_random.value(1, id_sucursal_aleatoria));
        select direccion into direccion_sucursal from sucursal where id = id_sucursal_aleatoria;
        dbms_output.put_line(' ');  
        mensaje_para_mostrar:= nombre_persona || ' será asignado a la sucursal de ' || direccion_sucursal;
        dbms_output.put_line(mensaje_para_mostrar);  
        dbms_output.put_line(' ');  
        dbms_output.put_line('----------------------------------------------------------------------------');

        --Ahora se hace la creacion del empleado
        INSERTAR_EMPLEADO(SEQ_PERSONA.CURRVAL, id_sucursal_aleatoria);
        
        mensaje_para_mostrar:= SEQ_PERSONA.CURRVAL || ' ----------------------------------id de la persona que se agrego anteriormenmte';
        dbms_output.put_line(mensaje_para_mostrar);  

--        INSERTAR_EMPLEADO(id_persona_recien_agregada, id_sucursal_aleatoria);

        id_persona_recien_agregada:=SEQ_PERSONA.CURRVAL;

        --Guardamos el id del ultimo empleado agregado
        select id into id_empleado_recien_insertado from empleado where id_persona = id_persona_recien_agregada;


        --seleccionamos el rol aleatorio, para corroborar si esta ucopado y es unico
        select max(id) into id_rol_aleatorio from rol;   --Selecciono la sucursal de la reserva, aleatoriamente
        id_rol_aleatorio := round(dbms_random.value(1, id_rol_aleatorio));
        select nombre into nombre_rol from rol where id = id_rol_aleatorio;

        dbms_output.put_line(' ');  
        mensaje_para_mostrar:= 'Y el rol que sera verificado y asignado para él será ' || nombre_rol;
        dbms_output.put_line(mensaje_para_mostrar);          
        dbms_output.put_line(' ');  
        dbms_output.put_line('----------------------------------------------------------------------------');


        select puesto_unico into rol_unico from rol where id = id_rol_aleatorio;

        --rol_unico:= 1;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        if (rol_unico = 1) then --Es unico el rol

            dbms_output.put_line(' ');  
            mensaje_para_mostrar:= 'El rol de ' || nombre_rol || ' es unico, por ende se verificara si el puesto ya esta ocupado por otro empleado en la sucursal ' || direccion_sucursal;
            dbms_output.put_line(mensaje_para_mostrar);          
            dbms_output.put_line(' ');  
            dbms_output.put_line('-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O');

            select count(id) into puesto_con_rol_en_sucursal from puesto where (id_sucursal = id_sucursal_aleatoria) and (id_rol = id_rol_aleatorio);

                if (puesto_con_rol_en_sucursal = 1) then --YA ESTA TOMADO EL PUESTO EN LA SUCURSAL
                    dbms_output.put_line(' ');  
                    mensaje_para_mostrar:= 'El rol de ' || nombre_rol || ' ya esta asignado a otro empleado en la sucursal de ' || direccion_sucursal ;
                    dbms_output.put_line(mensaje_para_mostrar);          
                    dbms_output.put_line(' ');  
                    mensaje_para_mostrar:= 'Se procederá a tomar una desición, despedir al otro empleado o asignar a ' || nombre_persona || ' otro puesto';
                    dbms_output.put_line(mensaje_para_mostrar);  
                    dbms_output.put_line(' ');  
                    dbms_output.put_line('-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O');

                    despedir_o_nuevo_rol := round(dbms_random.value(0, 1));

                    --despedir_o_nuevo_rol :=1;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                    if(despedir_o_nuevo_rol = 1) then       --Se procederá a despedir al empleado que esta tomando el cargo


                        select id into id_puesto_var from puesto       --Se guarda el id del puesto que esta asignado al empleadoanterior
                        where (id_sucursal = id_sucursal_aleatoria) and (id_rol= id_rol_aleatorio);


                         update puesto set id_empleado=id_empleado_recien_insertado where id=id_puesto_var;         --Se hace un UPDATE de esta tabla con el nuevo valor del id del nuevo empleado


                        dbms_output.put_line(' ');  
                        mensaje_para_mostrar:= 'Se acaba de deespedir al otro empleado, por ende se hizo actualización del puesto de trabajo de id ' || id_puesto_var || ' ahora ' || nombre_persona || ' es parte de de ese equipo';
                        dbms_output.put_line(mensaje_para_mostrar);          
                        dbms_output.put_line(' ');  
                        dbms_output.put_line('----------------------------------------------------------------------------');

                    else                                --Se le da un nuevo rol y ya al pana

                        mensaje_para_mostrar:= 'Se tomo la desición de dar un nuevo rol, antes de hacer un despido injustificado' ;
                        dbms_output.put_line(mensaje_para_mostrar);          
                        dbms_output.put_line(' ');  
                        dbms_output.put_line(' ');      

                        id_rol_nuevo := round(dbms_random.value(6, 11));
                        select sysdate into fecha_puesto from dual;
                        insert into puesto values (SEQ_PUESTO.NEXTVAL,fecha(fecha_puesto,fecha_puesto),id_sucursal_aleatoria,id_empleado_recien_insertado,id_rol_nuevo);
                        --insert into puesto values (999999,fecha(fecha_puesto,fecha_puesto),id_sucursal_aleatoria,id_empleado_recien_insertado,id_rol_nuevo);

                        select nombre into nombre_rol_nuevo from rol where id = id_rol_nuevo;
    
                        mensaje_para_mostrar:= 'A ' || nombre_persona || ' se le asigno el rol ' || nombre_rol_nuevo || ' en la sucursal de ' || direccion_sucursal;
                        dbms_output.put_line(mensaje_para_mostrar);  
                        dbms_output.put_line(' ');      
                        dbms_output.put_line('----------------------------------------------------------------------------');

                    end if;



                else    --NO ESTA TOMADO EL PUESTO
                    dbms_output.put_line(' ');  
                    mensaje_para_mostrar:= 'El rol de ' || nombre_rol || ' no ha sido asignado en la ' || direccion_sucursal || ' por lo tanto se le asignará a ' || nombre_persona;
                    dbms_output.put_line(mensaje_para_mostrar);          
                    dbms_output.put_line(' ');  
                    dbms_output.put_line('----------------------------------------------------------------------------');

                    entra_a_if_final := 1;

                end if;


        else    --No es unico el rol 

            dbms_output.put_line(' ');  
            mensaje_para_mostrar:= 'El rol de ' || nombre_rol || ' no es unico, por ende puede ser asignado cuantas veces se quiera en cualquier sucursal.';
            dbms_output.put_line(mensaje_para_mostrar);          
            dbms_output.put_line(' ');  
            dbms_output.put_line('----------------------------------------------------------------------------');

            entra_a_if_final := 1;
        end if;

     if (entra_a_if_final = 1) then 

        select sysdate into fecha_puesto from dual;
        insert into puesto values (SEQ_PUESTO.NEXTVAL,fecha(fecha_puesto,null),id_sucursal_aleatoria,id_empleado_recien_insertado,id_rol_aleatorio);

        --insert into puesto values (999,fecha(fecha_puesto,null),id_sucursal_aleatoria,id_empleado_recien_insertado,id_rol_aleatorio);


        mensaje_para_mostrar:= 'A ' || nombre_persona || ' se le asigno el rol ' || nombre_rol || ' en la sucursal de ' || direccion_sucursal;
        dbms_output.put_line(mensaje_para_mostrar);  
        dbms_output.put_line(' ');      
        dbms_output.put_line('----------------------------------------------------------------------------');
     end if;

    end; 
end;