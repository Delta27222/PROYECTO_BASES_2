create or replace procedure insertar_plato_dia
is
begin
    declare
    vr_id_plato plato.id%type;
    vr_fecha date;
    validate number;
    cont number;
    begin
    cont:=1;
    validate:=0;
    while cont >0
    loop
        select max(id) into vr_id_plato from plato;
        vr_id_plato:= trunc(dbms_random.value(1, vr_id_plato));
        select sysdate-round(dbms_random.value(0,8),0) into vr_fecha 
        from dual; --fecha aleatoria de los ultimos 8 dias
        
        select count(id) into validate --VALIDO SI ESE PLATO ESTA INSERTADO PARA ESA FECHA
        from plato_dia pl
        where pl.fecha_pla_dia.fecha_inicio = vr_fecha
        and id_plato = vr_id_plato;
        
        if validate=0 then --SI NO LO ESTA, INSERTO Y SALGO DEL CICLO
            insert into plato_dia values (seq_plato_dia.nextval, FECHA(vr_fecha,NULL), vr_id_plato);
            cont:=0;
            dbms_output.put_line('Se realizo la insercion de un plato al menu del dia');
        end if;

    end loop;
    
    end;
end;