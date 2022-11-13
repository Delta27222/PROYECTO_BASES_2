set serveroutput on
create or replace procedure simulacion_1
is
Begin
    Declare
        cant_reservas pls_integer;
        num_reserva integer;
        id_sucursal integer;
        nombre_sucursal varchar(20);
        fecha_rv date;
        cant_personas integer;
        id_persona integer;
        nombre_persona varchar(20);
        validate integer;
        resta integer;
        acum integer;
        iterador integer;
        reserva_id integer;
    begin
        num_reserva := 1;
        cant_reservas := dbms_random.value(3,10); --Se calcula con el random la cantidad de reservas a registrar
        dbms_output.put_line('Se realizaran ');
        dbms_output.put_line(cant_reservas);
        dbms_output.put_line('reservas');
        dbms_output.put_line('  ');
--        sys.dbms_output.put_line('Time 1: ' || to_char(systimestamp, 'hh24:mi:ss.ff'));
--        sys.dbms_session.sleep(10);
        
        
        while(num_reserva<=cant_reservas)
        loop
            dbms_output.put_line('  ');
            dbms_output.put_line('Se va a registrar la reserva:'); --Imprimo en pantalla la reserva a registrar
            dbms_output.put_line(num_reserva);
            dbms_output.put_line('  ');
            num_reserva:=num_reserva+1;
            
            select max(id) into id_sucursal from sucursal;   --Selecciono la sucursal de la reserva, aleatoriamente
            id_sucursal := dbms_random.value(1, id_sucursal);
            select nombre into nombre_sucursal from sucursal where id = id_sucursal;

            
            select sysdate-round(dbms_random.value(0,60),0) into fecha_rv from dual; --fecha aleatoria.
            
            cant_personas:= dbms_random.value(2,8); --Se calcula la cantidad de personas de la reserva
            
            select max(id) into id_persona from persona;   --Selecciono la cedula de la persona, aleatoriamente
            id_persona := dbms_random.value(1, id_persona);
            select nombre into nombre_persona from persona where id = id_persona;

            
            dbms_output.put('Se solicita realizar una reserva para el cliente ');
            dbms_output.put(nombre_persona);
            dbms_output.put(' para ');
            dbms_output.put(cant_personas);
            dbms_output.put_line(' personas, en la Sucursal de ');
            dbms_output.put(nombre_sucursal);
            dbms_output.put(' en la fecha del ');
            dbms_output.put(fecha_rv);
            dbms_output.put_line('  ');
            
            --Validacion de que en la sucursal seleccionada, existan puestos suficientes para la cantidad de personas
            --de la reserva
            
            select count(q.sucur) into validate 
            from (
                    select s.nombre sucur, sum(m.cant_puestos) puestos 
                    from mesa m
                    join sucursal s
                    on s.id = m.id_sucursal
                    left join (
                        select r.id_sucursal, mr.id_mesa, r.fecha_reserva.fecha_inicio 
                        from reserva r
                        join mesa_reservada mr
                        on mr.id_reserva = r.id
                        where r.fecha_reserva.fecha_inicio = fecha_rv
                        order by id_sucursal, id_mesa
                    ) mr
                    on mr.id_sucursal = s.id and mr.id_mesa = m.id
                    where mr.id_mesa is null
                    group by s.nombre
                ) q
            where q.puestos >= cant_personas
            and q.sucur like nombre_sucursal;
            
            dbms_output.put_line('----------------------------------------------------------------------------');
            
            if (validate = 0) then
            
                dbms_output.put_line('No hay mesas disponibles en la sucursal para esa reserva.');
                dbms_output.put_line('Intente nuevamente.');
                
            else if (validate = 1) then
                iterador:=cant_personas;
                INSERT INTO RESERVA (ID,fecha_reserva, CANT_PERSONAS,ID_SUCURSAL,ID_CLIENTE,ID_MESA) 
                VALUES(SEQ_RESERVA.nextval, fecha(fecha_rv,fecha_rv), to_number(cant_personas), to_number(id_sucursal), to_number(id_persona), 1);
                
                select max(id) into reserva_id from reserva;
                
                while (iterador >0)
                loop
                    
                    select max(m.id) into resta 
                    from mesa m
                    join sucursal s
                    on s.id = m.id_sucursal
                    left join (
                        select r.id_sucursal, mr.id_mesa, r.fecha_reserva.fecha_inicio 
                        from reserva r
                        join mesa_reservada mr
                        on mr.id_reserva = r.id
                        where r.fecha_reserva.fecha_inicio = fecha_rv
                        order by id_sucursal, id_mesa
                    ) mr
                    on mr.id_sucursal = s.id and mr.id_mesa = m.id
                    where mr.id_mesa is null
                    and s.nombre like nombre_sucursal
                    and m.cant_puestos <=cant_personas;
                    
                    insert into mesa_reservada values(seq_mesa_reservada.nextval, reserva_id, resta,id_sucursal);
                    
                    
                    
                    select cant_puestos into acum 
                    from mesa
                    where id = resta;
                    iterador:= iterador - acum;
                    
                end loop;
                
                dbms_output.put_line('Inserto xd');
            end if;
            end if;
            dbms_output.put_line('----------------------------------------------------------------------------');
            
            
        end loop;
    end; 
End;


