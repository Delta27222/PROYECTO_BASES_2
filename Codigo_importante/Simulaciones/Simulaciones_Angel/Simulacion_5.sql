create or replace NONEDITIONABLE procedure simulacion_5
is
Begin
    Declare
    mensaje_para_mostrar varchar(500);
    id_sucursal_aleatoria number;
    nombre_sucursal varchar(30);

    id_max_contabilidad number;

    acumulado_anterior number;

    cantidad_empleados_de_sucursal number;

    monto_unitario_pago_nomina number;
    monto_pago_nomina number;

    fecha_pago_nomina date;
    begin
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('                                                                        ');
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('*-*-*-*-*-*------Simulación 5:  Pagar Nómina a Trabajadores------*-*-*-*-*-*');          
        dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
        dbms_output.put_line('                                                                        ');

        --Se selecciona la sucursal de manera aleatoria que pagara 

        select max(id) into id_sucursal_aleatoria from sucursal;  
        id_sucursal_aleatoria := round(dbms_random.value(1, id_sucursal_aleatoria));

        --id_sucursal_aleatoria:=10;--------------------------------------------------------------------------------------------------------------CAMBIAR ESTO ES PARA PROBAR

        select direccion into nombre_sucursal from sucursal where id = id_sucursal_aleatoria;

        mensaje_para_mostrar := 'La sucursal de ' || nombre_sucursal || ' será la que pagará la nómina a sus empleados';
        dbms_output.put_line(mensaje_para_mostrar);    
        dbms_output.put_line('------------------------------------------------------------------------');

        --Obtenemos el monto que tiene la sucursal, para saber si puede pagar o no
        select max(id) into id_max_contabilidad from contabilidad where id_sucursal = id_sucursal_aleatoria;

        select con.acumulado.CANT_ACUMULADO into acumulado_anterior  from contabilidad con where id_sucursal = id_sucursal_aleatoria and id = id_max_contabilidad;

        mensaje_para_mostrar := 'El estado de cuenta de la sucursal de ' || nombre_sucursal || ' tiene como saldo ' || acumulado_anterior || '$';
        dbms_output.put_line(mensaje_para_mostrar);   
        dbms_output.put_line('------------------------------------------------------------------------');

        select count(id) into cantidad_empleados_de_sucursal from puesto where id_sucursal = id_sucursal_aleatoria;
        
        select pago_completo into monto_pago_nomina from (
            select p.id_sucursal, sum(r.sueldo.monto) pago_completo from puesto p
            join rol r
            on r.id = p.id_rol
            where id_sucursal = id_sucursal_aleatoria
            group by p.id_sucursal
        );

        mensaje_para_mostrar := 'La sucursal de ' || nombre_sucursal || ' tiene a su cargo a ' || cantidad_empleados_de_sucursal || ' empleados';
        dbms_output.put_line(mensaje_para_mostrar);   
        dbms_output.put_line('            ');   
        mensaje_para_mostrar := 'Y el monto total por todos los empleados es de ' || monto_pago_nomina || ' $';
        dbms_output.put_line(mensaje_para_mostrar);    
        dbms_output.put_line('------------------------------------------------------------------------');

        if (acumulado_anterior < monto_pago_nomina) then  --No puede hacer el pago de la nomina ya que no cuenta con fondos suficientes
            mensaje_para_mostrar := 'La sucursal de ' || nombre_sucursal || ' NO CUENTA CON SUFICIFIENTE saldo para poder hacer el pago de la nómina';
            dbms_output.put_line(mensaje_para_mostrar);   
            dbms_output.put_line('            ');   
            mensaje_para_mostrar := 'Lamentamos las molestias causadas, por favor no renuncien :c......La situación esta ruda ';
            dbms_output.put_line(mensaje_para_mostrar);    
            dbms_output.put_line('------------------------------------------------------------------------');
        else --Tiene para poder hacer el pago
            select sysdate-round(0)into fecha_pago_nomina from dual;
            
            --ASI ES PARA INSERTAR DE LA NADA
--            insert into contabilidad values(SEQ_CONTABILIDAD.NEXTVAL,-monto_pago_nomina,fecha(fecha_pago_nomina,null),acumulado(acumulado_anterior-monto_pago_nomina), id_sucursal_aleatoria);

            --ASI ES PARA INSERTAR CON UN ID
            insert into contabilidad values(100,-monto_pago_nomina,fecha(fecha_pago_nomina,null),acumulado(acumulado_anterior-monto_pago_nomina), id_sucursal_aleatoria);

            mensaje_para_mostrar := 'PAGO realizado con exito, se logro pagar la nomina de  ' || cantidad_empleados_de_sucursal || ' de monto total de ' || monto_pago_nomina || ' $';
            dbms_output.put_line(mensaje_para_mostrar);    
            dbms_output.put_line('------------------------------------------------------------------------');
        end if; 

    end; 
End;