--/////////////////////////////////////////////////////////////////////
--//////////////////////INSERCIONES PARA LA ENTREGA 1
--/////////////////////////////////////////////////////////////////////

--/////////////////////////////// INSERTAR RESTAURATE

EXECUTE INSERTAR_RESTAURANTE();

--/////////////////////////////// INSERTAR SUCURSALES

EXECUTE INSERTAR_SUCURSALES('Barquisimeto', 'Buena', '08:00 am - 20:00 pm');
EXECUTE INSERTAR_SUCURSALES('Los Teques', 'Mejor', '09:00 am - 20:00 pm');
EXECUTE INSERTAR_SUCURSALES('Valencia', 'Suculenta', '08:00 am - 20:00 pm');
EXECUTE INSERTAR_SUCURSALES('Valera', 'Buena', '10:00 am - 23:00 pm');
EXECUTE INSERTAR_SUCURSALES('El Hatillo', 'Buena', '10:00 am - 03:00 Am');
EXECUTE INSERTAR_SUCURSALES('Las Mercedes', 'Barata', '08:00 am - 20:00 pm');
EXECUTE INSERTAR_SUCURSALES('Coro', 'Gran', '10:00 am - 23:00 pm');
EXECUTE INSERTAR_SUCURSALES('Carora', 'Buena', '08:00 am - 20:00 pm');

--/////////////////////////////// INSERTAR PLATOS
EXECUTE INSERTAR_PLATO('Agua', 20, 'Bebida');
EXECUTE INSERTAR_PLATO('Cerveza', 30, 'Bebida');
EXECUTE INSERTAR_PLATO('Chicha', 37, 'Bebida');
EXECUTE INSERTAR_PLATO('Ginebra', 40, 'Bebida');
EXECUTE INSERTAR_PLATO('Jugo', 30, 'Bebida');
EXECUTE INSERTAR_PLATO('Malta', 25, 'Bebida');
EXECUTE INSERTAR_PLATO('Merengada', 30, 'Bebida');
EXECUTE INSERTAR_PLATO('Papelonada', 35, 'Bebida');
EXECUTE INSERTAR_PLATO('Refresco', 29, 'Bebida');
EXECUTE INSERTAR_PLATO('RicoMalt', 30, 'Bebida');
EXECUTE INSERTAR_PLATO('Ron', 40, 'Bebida');
EXECUTE INSERTAR_PLATO('Tequila', 34, 'Bebida');
EXECUTE INSERTAR_PLATO('Cachapa', 70, 'Bebida');
EXECUTE INSERTAR_PLATO('Pabellon', 110, 'Comida');
EXECUTE INSERTAR_PLATO('Paella', 110, 'Comida');
EXECUTE INSERTAR_PLATO('Parrilla', 90, 'Comida');
EXECUTE INSERTAR_PLATO('Pasticho', 97, 'Comida');
EXECUTE INSERTAR_PLATO('Patacones', 70, 'Comida');
EXECUTE INSERTAR_PLATO('Pizza', 87, 'Comida');
EXECUTE INSERTAR_PLATO('Shawarma', 70, 'Comida');
EXECUTE INSERTAR_PLATO('Hamburguesa', 70, 'Comida');
EXECUTE INSERTAR_PLATO('Sopa', 60, 'Comida');
EXECUTE INSERTAR_PLATO('Brownie', 47, 'Postre');
EXECUTE INSERTAR_PLATO('Galleta', 10, 'Postre');
EXECUTE INSERTAR_PLATO('Helado', 30, 'Postre');
EXECUTE INSERTAR_PLATO('Marmoleada', 35, 'Postre');
EXECUTE INSERTAR_PLATO('Marquesa', 40, 'Postre');
EXECUTE INSERTAR_PLATO('Oreo', 12, 'Postre');
EXECUTE INSERTAR_PLATO('Tiramisu', 38, 'Postre');
EXECUTE INSERTAR_PLATO('Tres leche', 40, 'Postre');
EXECUTE INSERTAR_PLATO('Turron', 29, 'Postre');


--/////////////////////////////// INSERTAR PERSONA

INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Javier', 'Rojas', 'M', (SELECT (4140000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Favio', 'Rojas', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Angel', 'Hernandez', 'M', (SELECT (4240000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Carlos', 'Ortega', 'M', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Simon', 'Azucar', 'M', (SELECT (4160000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Manuel', 'Olivares', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Francisco', 'Bolivar', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'DanielA', 'Colmenares', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Yoskleiber', 'Fanghella', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Estefani', 'Velez', 'F', (SELECT (4140000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Christina', 'Aguilera', 'F', (SELECT (4140000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Yulimar', 'Rojas', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Dave', 'Araujo', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Antonio', 'Hernandez', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Fabrizio', 'Nicotina', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jesus', 'Rojas', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Antonia', 'Azocar', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Ricardo', 'Puig', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Domingo', 'Bolivar', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Abril', 'Arizona', 'F', (SELECT (4160000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Raymond', 'Ortega', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Eleazar', 'Cuchitinni', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jhonny', 'Almeja', 'M', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Daniel', 'Quintero', 'M', (SELECT (4140000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Javier', 'Valero', 'M', (SELECT (4140000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Joshua', 'Trejo', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Ashly', 'de Rojas', 'F', (SELECT (4140000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Maria', 'Rogers', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Camila', 'Stark', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Joel', 'de Hernandez', 'F', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Carlos', 'Cabello', 'M', (SELECT (4160000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Juan', 'Carlos', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Fernando', 'Barrios', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jose', 'Palencia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Oswaldo', 'Roa', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Richard', 'Valecillos', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Kleisson', 'Rojas', 'M', (SELECT (4160000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Simon', 'Hernandez', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Naruto', 'Uzumaki', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Sasuke', 'Bolivar', 'M', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jesse', 'HombreRosa', 'M', (SELECT (4240000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Walter', 'Blanco', 'M', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Gustavo', 'Fring', 'M', (SELECT (4160000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Nacho', 'Jesuita', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Tuco', 'Salamanca', 'M', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Ederson', 'Royal', 'M', (SELECT (4260000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jhonny', 'Garcia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Alisson', 'Becker', 'M', (SELECT (4160000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Edinson', 'Colmenares', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jaimito', 'Garcia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Maximiliano', 'Fernandez', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Marcelo', 'Rojas', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Danilo', 'Garcia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Dayana', 'Buenarda', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Anaiz', 'Asensio', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Karen', 'Mata', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Karen', 'Dulabani', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Milagros', 'Hernandez', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Daniells', 'Garcia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Carla', 'Milani', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Natalia', 'Coronado', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Lucia', 'Coronado', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Patricia', 'Coronado', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Genesis', 'Dos Santos', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Kakashi', 'Nieto', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Tony', 'Garcia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Susana', 'Enrica', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Fernanda', 'Garcia', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Pablo', 'Gavira', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Chayanne', 'Dos Santos', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Khukhulan', 'Thacuerta', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Alonso', 'Colmenares', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Santiago', 'Garcia', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Alejandro', 'Fernandez', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Daniela', 'Rojas', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Ricardo', 'Garcia', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Viviana', 'Buenarda', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Valeria', 'Asensio', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Naileth', 'Mata', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Javier', 'Dulabani', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Maria', 'Hernandez', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'San Lucas', 'Cucuto', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Freddie', 'Milani', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Enrique', 'Coronado', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Capriles', 'Radonski', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Patricia', 'Coronado', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Genesis', 'Dos Santos', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Emilia', 'Nieto', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Jimena', 'Garcia', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Oriana', 'Enrica', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Camila', 'Garcia', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Ivan', 'Gavira', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Alexandra', 'Dos Santos', 'M', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);
INSERT INTO PERSONA values (SEQ_PERSONA.NEXTVAL, (SELECT (12000111+ABS(MOD(dbms_random.random,28472023))) FROM   dual), 'Rubena', 'Thacuerta', 'F', (SELECT (4120000000+ABS(MOD(dbms_random.random,9999999))) FROM   dual), (select sysdate-round(dbms_random.value(0,13000),0) from dual), 1,1);



--/////////////////////////////// INSERTAR EMPLEADO
EXECUTE INSERTAR_EMPLEADO(1,1);
EXECUTE INSERTAR_EMPLEADO(2,1);
EXECUTE INSERTAR_EMPLEADO(3,1);
EXECUTE INSERTAR_EMPLEADO(4,1);
EXECUTE INSERTAR_EMPLEADO(5,1);
EXECUTE INSERTAR_EMPLEADO(6,1);
EXECUTE INSERTAR_EMPLEADO(7,1);
EXECUTE INSERTAR_EMPLEADO(8,2);
EXECUTE INSERTAR_EMPLEADO(9,2);
EXECUTE INSERTAR_EMPLEADO(10,2);
EXECUTE INSERTAR_EMPLEADO(11,2);
EXECUTE INSERTAR_EMPLEADO(12,2);
EXECUTE INSERTAR_EMPLEADO(13,2);
EXECUTE INSERTAR_EMPLEADO(14,2);
EXECUTE INSERTAR_EMPLEADO(15,2);
EXECUTE INSERTAR_EMPLEADO(16,2);
EXECUTE INSERTAR_EMPLEADO(17,2);
EXECUTE INSERTAR_EMPLEADO(18,3);
EXECUTE INSERTAR_EMPLEADO(19,3);
EXECUTE INSERTAR_EMPLEADO(20,3);
EXECUTE INSERTAR_EMPLEADO(21,3);
EXECUTE INSERTAR_EMPLEADO(22,3);
EXECUTE INSERTAR_EMPLEADO(23,3);
EXECUTE INSERTAR_EMPLEADO(24,3);
EXECUTE INSERTAR_EMPLEADO(25,8);
EXECUTE INSERTAR_EMPLEADO(26,3);
EXECUTE INSERTAR_EMPLEADO(27,4);
EXECUTE INSERTAR_EMPLEADO(28,4);
EXECUTE INSERTAR_EMPLEADO(29,4);
EXECUTE INSERTAR_EMPLEADO(30,4);
EXECUTE INSERTAR_EMPLEADO(31,4);
EXECUTE INSERTAR_EMPLEADO(32,4);
EXECUTE INSERTAR_EMPLEADO(33,4);
EXECUTE INSERTAR_EMPLEADO(34,8);
EXECUTE INSERTAR_EMPLEADO(35,5);
EXECUTE INSERTAR_EMPLEADO(36,5);
EXECUTE INSERTAR_EMPLEADO(37,5);
EXECUTE INSERTAR_EMPLEADO(38,5);
EXECUTE INSERTAR_EMPLEADO(39,5);
EXECUTE INSERTAR_EMPLEADO(40,5);
EXECUTE INSERTAR_EMPLEADO(41,5);
EXECUTE INSERTAR_EMPLEADO(44,5);
EXECUTE INSERTAR_EMPLEADO(45,5);
EXECUTE INSERTAR_EMPLEADO(60,6);
EXECUTE INSERTAR_EMPLEADO(61,6);
EXECUTE INSERTAR_EMPLEADO(62,6);
EXECUTE INSERTAR_EMPLEADO(63,6);
EXECUTE INSERTAR_EMPLEADO(64,6);
EXECUTE INSERTAR_EMPLEADO(65,6);
EXECUTE INSERTAR_EMPLEADO(66,6);
EXECUTE INSERTAR_EMPLEADO(67,6);
EXECUTE INSERTAR_EMPLEADO(50,7);
EXECUTE INSERTAR_EMPLEADO(51,7);
EXECUTE INSERTAR_EMPLEADO(52,7);
EXECUTE INSERTAR_EMPLEADO(53,7);
EXECUTE INSERTAR_EMPLEADO(54,7);
EXECUTE INSERTAR_EMPLEADO(55,7);
EXECUTE INSERTAR_EMPLEADO(56,8);
EXECUTE INSERTAR_EMPLEADO(57,8);
EXECUTE INSERTAR_EMPLEADO(58,8);
EXECUTE INSERTAR_EMPLEADO(59,8);


--/////////////////////////////// INSERTAR ROLES

INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Gerente General', 'Se encarga de llevar todo el orden en la sucursal asignada, tanto en la cocina como afuera de ella', monto(4200, 'Bs'), 1);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Subgerente', 'Se encarga de reportar todo relacionado a los meseros, al gerente', monto(3350, 'Bs'), 1);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Chef Ejecutivo', 'Se encarga de manejar el menu al publico, promos y platos del dia', monto(3490, 'Bs'), 1);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Segundo Chef', 'Es el chef en jefe el cual lleva el orden en la cocina y asigna platos a los chef', monto(2900, 'Bs'), 1);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Chef', 'Se encarga de cocinar los platos que se le asignen por orden', monto(2500, 'Bs'), 1);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Mesero', 'Se encarga de recibir las ordenes de los clientes y atenderlos', monto(2100, 'Bs'), 0);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Pastelero', 'Se encarga de cocinar todo lo relacionado a postres que se le asigne', monto(2350, 'Bs'), 0);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Corredor', 'Se encarga de hacer el trabajo del mesero mas facil llevando los platos a los clientes', monto(2110, 'Bs'), 0);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Anfitrion', 'Se encarga de recibir a los clientes en las sucursales y asignarles una mesa', monto(2290, 'Bs'), 0);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Bartender', 'Se encarga de preparar los tragos que se le hayan asignado', monto(2240, 'Bs'), 0);
INSERT INTO ROL VALUES (SEQ_ROL.NEXTVAL, 'Valet', 'Se encarga de controlar el area del estacionamiento cuidando los autos', monto(2150, 'Bs'), 0);

--///////////////////////////////INSERTAR PUESTOS


INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 1,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 2,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 3,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 4,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 5,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 6,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 7,seq_puesto.currval,11);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,1);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,2);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,3);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,4);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,5);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,6);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,7);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,8);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,9);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,10);
INSERT INTO PUESTO VALUES (SEQ_PUESTO.NEXTVAL, FECHA(
(select sysdate-round(dbms_random.value(0,90),0) from dual), null), 8,seq_puesto.currval,11);


--/////////////////////////////// INSERTAR MESA
--(ID, NUMMESA, CANTPUESTO, SUCURSALID)
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 7, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),1);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 7, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),2);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),3);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),3);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),3);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),3);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),3);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),3);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),4);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),4);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),4);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),4);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),4);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),4);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 7, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),5);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),6);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),6);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),6);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),6);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),6);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),6);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 7, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),7);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 1, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 2, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 3, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 4, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 5, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 6, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 7, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);
INSERT INTO MESA VALUES (SEQ_MESA.NEXTVAL, 8, (SELECT (2+ABS(MOD(dbms_random.random,5))) FROM DUAL),8);


--/////////////////////////////// INSERTAR ENCUESTA PARA SUCURSALES Y RESTAURANE

INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Restaurante',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
10, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
8, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
7, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
7, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
7, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
7, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
9, 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);
INSERT INTO ENCUESTA VALUES (SEQ_ENCUESTA.NEXTVAL, 
'Comida',
(SELECT (1+ABS(MOD(dbms_random.random,10))) FROM DUAL), 
NULL,
FECHA((select sysdate-round(dbms_random.value(0,45),0) from dual), null),
(SELECT (1+ABS(MOD(dbms_random.random,100))) FROM DUAL),
(SELECT (1+ABS(MOD(dbms_random.random,8))) FROM DUAL),
null);

