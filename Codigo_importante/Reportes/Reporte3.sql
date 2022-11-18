create or replace procedure reporte_3(cur in out sys_refcursor, fecha_inicio_var date, fecha_fin_var date, intervalo_inferior number, intervalo_superior number)
is 
Begin
    open cur for
    select to_char(promo.fecha_promo.fecha_inicio), to_char(promo.fecha_promo.fecha_fin), promo.descripcion, pla.nombre, pla.foto, concat(to_char(promo.descuento),'%'), concat(to_char(pla.precio.monto),'$'), concat(to_char(promo.precio_fin.monto),'$') from promocion promo
    inner join Plato pla on  promo.id_plato = pla.id
    where (pla.precio.monto between  intervalo_inferior and intervalo_superior) and (promo.fecha_promo.fecha_inicio between fecha_inicio_var and fecha_fin_var);
end;