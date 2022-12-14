CREATE OR REPLACE TRIGGER CREA_COMPRA_Y_PLATOS after INSERT ON CONSUMO
FOR EACH ROW
DECLARE
    CANT_PLATOS INTEGER;
    VR_ID_PLATO INTEGER;
    monto integer;
BEGIN
    CANT_PLATOS:=dbms_random.value(1,12);
    WHILE (CANT_PLATOS>0)
    LOOP
        SELECT MAX(ID) INTO VR_ID_PLATO FROM PLATO;
        VR_ID_PLATO:=dbms_random.value(1, VR_ID_PLATO);
        SELECT ID INTO VR_ID_PLATO FROM PLATO WHERE ID = VR_ID_PLATO;
        INSERT INTO PLATO_CONSUMIDO VALUES (SEQ_PLATO_CONSUMIDO.NEXTVAL, VR_ID_PLATO, :NEW.ID);
        CANT_PLATOS:=CANT_PLATOS-1;
    END LOOP;
    
    select sum(p.precio.monto) into monto from plato p
    join plato_consumido pc
    on pc.id_plato = p.id
    where pc.id_consumo = :new.id;
    
    
    simulacion_8(monto, :new.id_sucursal, :new.id_cliente);

    
END;
