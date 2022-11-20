create or replace procedure insertar_promocion
is
begin
    declare
        random_promo integer;
        vr_id_plato plato.id%type;
        vr_fecha date;
        validate number;
        cont number;
        type array_t is varray(10) of varchar2(30);
        array array_t := array_t('10', '20', '30','40', '50', '60','70', '80','2x1','3x2');
        precio_vr number;
        unidad varchar(3);
    begin
        cont:=1;
        validate:=0;
        while cont >0
        loop
            select max(id) into vr_id_plato from plato;
            vr_id_plato:= trunc(dbms_random.value(1, vr_id_plato));
            select sysdate-round(dbms_random.value(0,8),0) into vr_fecha 
            from dual; --fecha aleatoria de los ultimos 8 dias
            
            select count(id) into validate --VALIDO SI ESE PLATO YA TIENE UNA PROMOCION PARA ESA FECHA
            from PROMOCION p
            where p.fecha_PROMO.fecha_inicio = vr_fecha
            and id_plato = vr_id_plato;
            
            if validate=0 then --SI NO LO ESTA, INSERTO Y SALGO DEL CICLO
                
                select p.precio.monto into precio_vr --BUSCO EL PRECIO ORIGINAL DEL PLATO
                from plato p
                where p.id = vr_id_plato;
                
                SELECT P.PRECIO.UNIDAD_MONTO INTO UNIDAD FROM PLATO P
                where p.id = vr_id_plato;
            
                random_promo:=trunc(dbms_random.value(1, 10)); --random para definir que promo va a tener
                
                if (array(random_promo) = '2x1') then
                    insert into promocion values 
                    (seq_promocion.nextval, array(random_promo), 50, monto((precio_vr*(50*0.01)),unidad), fecha(vr_fecha,null), vr_id_plato);
                else if (array(random_promo) = '3x2') then
                    insert into promocion values 
                    (seq_promocion.nextval, array(random_promo), 30, monto((precio_vr*(70*0.01)),unidad), fecha(vr_fecha,null), vr_id_plato);
                else
                    insert into promocion values 
                    (seq_promocion.nextval, concat(array(random_promo),'%'), to_number(array(random_promo)), monto((precio_vr*((100 - to_number(array(random_promo)))*0.01)),unidad), fecha(vr_fecha,null), vr_id_plato);
                end if;
                end if;
                
                cont:=0;
                dbms_output.put_line('Se realizo la insercion de un plato en las promociones');
            end if;
    
        end loop;
        
    end;
end;