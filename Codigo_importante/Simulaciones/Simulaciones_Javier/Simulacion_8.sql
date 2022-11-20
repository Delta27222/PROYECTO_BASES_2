create or replace procedure simulacion_8 (mont_total integer, vr_id_sucursal sucursal.id%type, vr_id_cliente persona.id%type)
is
begin
    DECLARE
    cant_pagos integer;
    mont_pago integer;
    vr_mont integer;
    cont integer;
    type array_t is varray(8) of varchar2(30);
    array array_t := array_t('Efectivo', 'POS', 'Zelle','Pipol', 'Pay', 'PayPal','Zinli', 'Criptomonedas');
    numero_aleatorio_tipo number;
    nombre_cliente varchar(100);
    BEGIN
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*--------Simulación 8: Realizar Compra--------*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');
        
        INSERT INTO COMPRA VALUES 
        (SEQ_COMPRA.NEXTVAL, 
        FECHA((select sysdate-round(dbms_random.value(0,10),0) from dual),NULL), 
        MONTO(MONT_TOTAL, 'Bs'),VR_ID_SUCURSAL,VR_ID_CLIENTE);
        
            dbms_output.put_line('  ');
            dbms_output.put('Se registro la compra: '); --Imprimo en pantalla la compra a registrar
            dbms_output.put(seq_compra.currval);
            dbms_output.put_line('  ');
            dbms_output.put_line('--------------------------------------------------------');
            select to_char(cedula) into nombre_cliente from persona where id = vr_id_cliente; 
            dbms_output.put('Cedula cliente: ');
            dbms_output.put_line(nombre_cliente);
            dbms_output.put('Nombre cliente: ');
            select nombre into nombre_cliente from persona where id = vr_id_cliente;
            dbms_output.put(nombre_cliente);
            dbms_output.put(' ');
            select apellido into nombre_cliente from persona where id = vr_id_cliente;
            dbms_output.put_line(nombre_cliente);
            dbms_output.put('Monto a pagar: ');
            dbms_output.put(mont_total);
            dbms_output.put_line(' Bs');
            dbms_output.put_line('--------------------------------------------------------');
        
        cant_pagos:=dbms_random.value(1,8);
        vr_mont:=mont_total;
        cont:=0;
        
        while cant_pagos > 0 and vr_mont > 0
        loop
            cont:= cont + 1;
            numero_aleatorio_tipo:= dbms_random.value(1,8); 
            mont_pago:=dbms_random.value(1,vr_mont);
            vr_mont:=vr_mont-mont_pago;
            insert into pago values (seq_pago.nextval, monto(mont_pago, 'Bs'), 
            array(numero_aleatorio_tipo), 
            seq_compra.currval);
            dbms_output.put_line('--------------------------------------------------------');
            dbms_output.put('Con el pago: ');
            dbms_output.put_line(cont);
            dbms_output.put_line('--------------------------------------------------------');
            dbms_output.put('Monto: ');
            dbms_output.put(mont_pago);
            dbms_output.put_line(' Bs');
            dbms_output.put('Forma de pago: ');
            dbms_output.put_line(array(numero_aleatorio_tipo));
            dbms_output.put_line('--------------------------------------------------------');
            cant_pagos:=cant_pagos-1;
        end loop;
        
        if vr_mont >0 then
            cont:= cont + 1;
            numero_aleatorio_tipo:= dbms_random.value(1,8); 
            insert into pago values (seq_pago.nextval, monto(vr_mont, 'Bs'), 
            array(numero_aleatorio_tipo), 
            seq_compra.currval);
            dbms_output.put_line('--------------------------------------------------------');
            dbms_output.put('Con el pago: ');
            dbms_output.put_line(cont);
            dbms_output.put_line('--------------------------------------------------------');
            dbms_output.put('Monto: ');
            dbms_output.put(vr_mont);
            dbms_output.put_line(' Bs');
            dbms_output.put('Forma de pago: ');
            dbms_output.put_line(array(numero_aleatorio_tipo));
            dbms_output.put_line('--------------------------------------------------------');
        end if;
    END;
end;
