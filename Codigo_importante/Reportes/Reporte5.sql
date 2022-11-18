create or replace procedure reporte_5 (cur in out sys_refcursor)
is
begin
open cur for
    select s.direccion, r.nombre, r.logo, s.mapa, (b.promotores*100)/a.cant_respuestas
    from sucursal s
    join restaurante r
    on r.id = s.id_restaurante
    join (
        select id_sucursal, count(valoracion) cant_respuestas
        from encuesta e
        group by id_sucursal
    ) a 
    on a.id_sucursal = s.id
    join (
        select id_sucursal, sum(valoracion) promotores
        from encuesta e
        group by id_sucursal
    )b
    on b.id_sucursal = s.id;
    --group by s.direccion, r.nombre, r.logo, s.mapa, b.promotores, a.cant_respuestas;
end;    

