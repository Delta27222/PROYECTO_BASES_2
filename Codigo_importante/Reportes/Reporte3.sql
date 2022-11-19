create or replace procedure reporte_3(cur in out sys_refcursor, fecha_inicio_var date, fecha_fin_var date, intervalo_inferior number, intervalo_superior number)
is 
Begin
declare
    f_ini DATE;
    f_fin DATE;
    inter_infer number;
    inter_sup number;
    begin
        if (intervalo_inferior is null) then
            select min(pla.precio.monto) into inter_infer from plato pla;
        else inter_infer:=intervalo_inferior;
        end if;
    
        if (intervalo_superior is null) then
            select max(pla.precio.monto) into inter_sup from plato pla;
        else inter_sup:=intervalo_superior; 
        end if;
    
        if (fecha_inicio_var is null) then
            select min(c.fecha_promo.fecha_inicio) into f_ini from promocion c;
        else f_ini:= to_date(fecha_inicio_var);    
        end if;
    
        if (fecha_fin_var is null) then
            select max(c.fecha_promo.fecha_inicio) into f_fin from promocion c;
        else f_fin:= to_date(fecha_fin_var);
        end if;
    
        open cur for
        select to_char(promo.fecha_promo.fecha_inicio), to_char(promo.fecha_promo.fecha_fin), 
        promo.descripcion, pla.nombre, pla.foto, concat(to_char(promo.descuento),'%'), concat(to_char(pla.precio.monto),'$'), 
        concat(to_char(promo.precio_fin.monto),'$') 
        from promocion promo
        inner join Plato pla 
        on  promo.id_plato = pla.id
        where (pla.precio.monto between  inter_infer and inter_sup) and 
        (promo.fecha_promo.fecha_inicio between f_ini and f_fin);
    end;
end;



