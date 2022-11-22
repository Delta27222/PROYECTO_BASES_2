CREATE OR REPLACE TRIGGER ABRIR_CUENTA_SUCURSAL_CONTABILIDAD after INSERT ON SUCURSAL
FOR EACH ROW
DECLARE
    fecha_pago_nomina date;
BEGIN
            select sysdate-round(0)into fecha_pago_nomina from dual;
            insert into contabilidad values(SEQ_CONTABILIDAD.NEXTVAL,0,fecha(fecha_pago_nomina,null),acumulado(0), :NEW.id);
--          insert into contabilidad values(9999,0,fecha(fecha_pago_nomina,null),acumulado(0), :NEW.id);    
END;


--Este triger se usa para que cada que se cree una sucursal, se cree en la tabla de contabilidad la "cuenta de fondos" de la sucursa
-- empezando por un valor de 0$