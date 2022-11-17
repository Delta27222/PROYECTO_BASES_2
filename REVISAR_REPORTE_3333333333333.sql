

execute INSERTAR_PROMOCION_CON_ID_PUESTO(4,'3x1', 50, to_date('14-NOV-22'), to_date('16-NOV-22'), 11);


SELECT * FROM PLATO 


SELECT P.PRECIO_FIN.MONTO FROM PROMOCION P



create or replace  procedure reporte_3(fecha_inicio date, fecha_fin date, intervalo_inferior number, intervalo_superior number)
is 
Begin
    select promo.fecha_promo.fecha_inicio, promo.fecha_promo.fecha_fin, promo.descripcion, pla.nombre, pla.foto, promo.descuento, pla.precio.monto, promo.precio_fin.monto from promocion promo
    inner join Plato pla on  promo.id_plato = pla.id; 
end;



SELECT P.PRECIO_FIN.MONTO FROM PROMOCION P


select pla.precio.monto from plato pla





