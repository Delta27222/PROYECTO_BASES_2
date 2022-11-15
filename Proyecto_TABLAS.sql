--*************************************************************************CREACION DE LOS TDA'S*************************************************************************--

--FECHA*******************************************************************************************
CREATE OR REPLACE TYPE FECHA AS OBJECT(
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    
    STATIC FUNCTION VALIDATE_DATE ( FECHA_INICIO DATE, FECHA_FIN DATE ) RETURN DATE
);

CREATE OR REPLACE TYPE BODY FECHA AS
    STATIC FUNCTION VALIDATE_DATE( FECHA_INICIO DATE, FECHA_FIN DATE )
    RETURN DATE
    IS
    BEGIN
        --RAISE_APPLICATION_ERROR(-20001,'ERROR EN LAS FECHAS');
        IF ((FECHA_FIN > FECHA_INICIO)) THEN
                RETURN FECHA_INICIO;
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'ERROR EN LAS FECHAS');
        END IF;
    END;
END;

--MONTO*******************************************************************************************
CREATE OR REPLACE TYPE MONTO AS OBJECT(
    MONTO NUMBER,
    UNIDAD_MONTO VARCHAR(3),
    
    STATIC FUNCTION VALIDATE_MONTO ( MONTO NUMBER) RETURN NUMBER
);


CREATE OR REPLACE TYPE BODY MONTO AS
    STATIC FUNCTION VALIDATE_MONTO( MONTO NUMBER )
    RETURN NUMBER
    IS
    BEGIN
        IF ((MONTO > 0)) THEN
            RETURN MONTO;
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'ERROR, EL MONTO DEBE SER POSITIVO');
        END IF;
    END;
END;

--ACUMULADO*******************************************************************************************VERIFICAR ESTO
CREATE OR REPLACE TYPE ACUMULADO AS OBJECT(
    CANT_ACUMULADO NUMBER,
    
    STATIC FUNCTION CALCULATE_ACUM_INV ( ID_SUCURSAL NUMBER, ID_PRODUCTO NUMBER) RETURN NUMBER,
    STATIC FUNCTION CALCULATE_ACUM_CONT ( ID_SUCURSAL NUMBER) RETURN NUMBER
);

CREATE OR REPLACE TYPE BODY ACUMULADO AS
    STATIC FUNCTION CALCULATE_ACUM_INV(  ID_SUCURSAL NUMBER, ID_PRODUCTO NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        ---------ACA HACES LO QUE TENGAS QUE HACER
        dbms_output.put_line('ACA HACES LO QUE TENGAS QUE HACER');
    END;
    STATIC FUNCTION CALCULATE_ACUM_CONT( ID_SUCURSAL NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        ---------ACA HACES LO QUE TENGAS QUE HACER
        dbms_output.put_line('ACA HACES LO QUE TENGAS QUE HACER');
    END;
END;

CREATE OR REPLACE TYPE BODY ACUMULADO AS
    STATIC FUNCTION CALCULATE_ACUM_CONT( ID_SUCURSAL NUMBER)
    RETURN NUMBER
    IS
    BEGIN
        ---------ACA HACES LO QUE TENGAS QUE HACER
        dbms_output.put_line('ACA HACES LO QUE TENGAS QUE HACER');
    END;
END;

--*************************************************************************CREACION DE LOS TDA'S*************************************************************************--

--*************************************************************************CREACION DE LAS TABLAS*************************************************************************--
---------------------------------------------------------
--RESTAURANTE
CREATE TABLE RESTAURANTE(
    ID NUMBER NOT NULL,
    NOMBRE VARCHAR(20) PRIMARY KEY NOT NULL,
    LOGO BLOB DEFAULT EMPTY_BLOB() NOT NULL,

    CONSTRAINT UQ_ID_RESTAURANTE UNIQUE(ID)
);

CREATE SEQUENCE SEQ_RESTAURANTE --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------VERIFICAR HORARIO
--SUCURSAL
CREATE TABLE SUCURSAL (
    ID NUMBER PRIMARY KEY NOT NULL,
    DIRECCION VARCHAR(20) NOT NULL,
    DESCRIPCION VARCHAR(20) NOT NULL,
    MAPA BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    HORARIO VARCHAR(20) NOT NULL,
    ID_RESTAURANTE NUMBER NOT NULL,
    
    CONSTRAINT  FK_RESTAURANTE_SUCURSAL FOREIGN KEY (ID_RESTAURANTE) REFERENCES RESTAURANTE(ID)
);

CREATE SEQUENCE SEQ_SUCURSAL --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--PRODUCTO
CREATE TABLE PRODUCTO(
    NOMBRE VARCHAR(20) PRIMARY KEY NOT NULL,
    ID NUMBER NOT NULL,
    FOTO BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    PRECIO_UNITARIO MONTO,  ----OJO
    UNIDAD VARCHAR(3) NOT NULL,
    CANT_MINIMA NUMBER NOT NULL,

    CONSTRAINT UQ_ID_PRODUCTO UNIQUE(ID),

    CONSTRAINT CH_UNIDAD CHECK (UNIDAD = 'Kg' OR UNIDAD = 'Lts' OR UNIDAD = 'Gr'), --Aca se puede cambiar o agregar tipo de unidad
    CONSTRAINT CH_CANT_MINIMA CHECK (CANT_MINIMA > 0)
);

CREATE SEQUENCE SEQ_PRODUCTO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--INVENTARIO
CREATE TABLE INVENTARIO (
    ID NUMBER PRIMARY KEY NOT NULL,
    FECHA_INVENTARIO FECHA NOT NULL,    --OJO ESTO ES UN TDA
    CANTIDAD NUMBER NOT NULL,
    ACUMULADO ACUMULADO NOT NULL, --- OJO ESTO ES UN TDA
    ID_PRODUCTO NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    
    CONSTRAINT  FK_PRODUCTO_INVENTARIO FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID),
    CONSTRAINT  FK_SUCURSAL_INVENTARIO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),

    CONSTRAINT CH_CANTIDAD_POSITIVA CHECK (CANTIDAD>=0)
);

CREATE SEQUENCE SEQ_INVENTARIO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--GRUPO
CREATE TABLE GRUPO (
    ID NUMBER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    DESCRIPCION VARCHAR(100) NOT NULL
);

CREATE SEQUENCE SEQ_GRUPO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------VERIFICAR LO DE LAS HORAS
--EVENTO
CREATE TABLE EVENTO (
    ID NUMBER PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    CONDICIONES VARCHAR(100) NOT NULL,
    HORA_INICIO NUMBER NOT NULL,  -- CAMBIADO A NUMBER, PARA PODER MANEJAR MEJOR LA HORA DE INICIO DEL EVENTO
    HORA_FIN NUMBER NOT NULL,     -- CAMBIADO A NUMBER, PARA PODER MANEJAR MEJOR LA HORA DE INICIO DEL EVENTO
    FECHA_EVENTO FECHA, --OJO
    ID_GRUPO NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    
    CONSTRAINT  FK_GRUPO_EVENTO FOREIGN KEY (ID_GRUPO) REFERENCES GRUPO(ID),
    CONSTRAINT  FK_SUCURSAL_EVENTO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID)
);

CREATE SEQUENCE SEQ_EVENTO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo


---------------------------------------------------------
--PERSONA
CREATE TABLE PERSONA(
    ID NUMBER primary key NOT NULL,
    CEDULA NUMBER NOT NULL UNIQUE,
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO VARCHAR(30) NOT NULL,
    GENERO VARCHAR(3) NOT NULL,
    TELEFONO NUMBER NOT NULL,
    FECHA_NAC DATE,
    
    CLIENTE NUMBER NOT NULL,
    EMPLEADO NUMBER NOT NULL,

    CONSTRAINT CH_CEDULA CHECK (CEDULA < 100000000),
    CONSTRAINT CH_TELEFONO CHECK (TELEFONO < 100000000000),
    CONSTRAINT CH_GENERO CHECK (GENERO = 'M' OR GENERO = 'F' OR GENERO = 'N/A'),
    CONSTRAINT CH_CLIENTE_EMPLEADO CHECK ((CLIENTE = 1 AND EMPLEADO = 0) OR (CLIENTE = 0 AND EMPLEADO = 1)) --VERIFICAR, PORQUE UN EMPLEADO PUEDE SER CLIENTE
);


CREATE SEQUENCE SEQ_PERSONA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

--------------------------------------------------------
--EMPLEADO
CREATE TABLE EMPLEADO(
    ID NUMBER PRIMARY KEY NOT NULL,
    FOTO BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    FECHA_CONTRATACION FECHA , --OJO
    MOTIVO_EGRESO VARCHAR(30) NOT NULL,
    ID_PERSONA NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    
    CONSTRAINT  FK_SUCURSAL_EMPLEADO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    CONSTRAINT  FK_PERSONA_EMPLEADO FOREIGN KEY (ID_PERSONA) REFERENCES PERSONA(id)
);
CREATE SEQUENCE SEQ_EMPLEADO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--PLATO
CREATE TABLE PLATO(
    NOMBRE VARCHAR(20)PRIMARY KEY NOT NULL,
    ID NUMBER NOT NULL,
    PRECIO MONTO, -------OJO
    FOTO BLOB DEFAULT EMPTY_BLOB() NOT NULL,
    DESCRIPCION VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,

    CONSTRAINT UQ_ID_PLATO UNIQUE(ID),
    CONSTRAINT CH_CATEGORIA CHECK (CATEGORIA = 'Comida' OR CATEGORIA = 'Bebida' OR CATEGORIA = 'Postre') --Aca se puede cambiar o agregar  categorias nuevas
);

CREATE SEQUENCE SEQ_PLATO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--ENCUESTA
CREATE TABLE ENCUESTA(
    ID NUMBER PRIMARY KEY NOT NULL,
    TIPO VARCHAR(30) NOT NULL,
    VALORACION NUMBER NOT NULL,
    OBSERVACION VARCHAR(100) NOT NULL,
    FECHA_ENCUESTA FECHA, --OJO
    ID_CLIENTE NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NULL,
    ID_PLATO NUMBER NULL,
    
    CONSTRAINT  FK_SUCURSAL_ENCUESTA FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    CONSTRAINT  FK_CLIENTE_ENCUESTA FOREIGN KEY (ID_CLIENTE) REFERENCES PERSONA(CEDULA),
    CONSTRAINT  FK_PLATO_ENCUESTA FOREIGN KEY (ID_PLATO) REFERENCES PLATO(ID),

    CONSTRAINT CH_TIPO CHECK (TIPO = 'Comida' OR TIPO = 'Restaurante'),  --verificar que esto sea asi
    CONSTRAINT CH_VALORACION CHECK (VALORACION IN (1,2,3,4,5,6,7,8,9,10)),
    CONSTRAINT CH_ENCUENTAS_SUCURSAL_O_PLATO CHECK ((ID_SUCURSAL = 0 AND ID_PLATO = 1) OR (ID_SUCURSAL = 1 OR ID_PLATO = 0))
);

CREATE SEQUENCE SEQ_ENCUESTA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo
---------------------------------------------------------
--ROL
CREATE TABLE ROL(
    ID NUMBER NOT NULL,
    NOMBRE VARCHAR(20) PRIMARY KEY NOT NULL,
    FUNCION VARCHAR(30) NOT NULL,
    SUELDO MONTO,                -----OJO,
    PUESTO_UNICO NUMBER NOT NULL,

    CONSTRAINT UQ_ID_ROL UNIQUE(ID),
    CONSTRAINT CH_PUESTO_UNICO CHECK (PUESTO_UNICO = 1 OR PUESTO_UNICO = 0)
);

CREATE SEQUENCE SEQ_ROL --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo


---------------------------------------------------------
--PUESTO
CREATE TABLE PUESTO(
    ID NUMBER PRIMARY KEY NOT NULL,
    FECHA_PUESTO FECHA , --OJO
    ID_SUCURSAL NUMBER NOT NULL,
    ID_EMPLEADO NUMBER NOT NULL,
    ID_ROL NUMBER NOT NULL,

    CONSTRAINT  FK_SUCURSAL_PUESTO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    CONSTRAINT  FK_EMPLEADO_PUESTO FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID),
    CONSTRAINT  FK_ROL_PUESTO FOREIGN KEY (ID_ROL) REFERENCES ROL(ID)
);

CREATE SEQUENCE SEQ_PUESTO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------VERIFICAR SI LAS LLAVES PRIMARIAS SE COLOCARON BIEN
--MESA
CREATE TABLE MESA(
    ID NUMBER  NOT NULL,
    NUMERO NUMBER NOT NULL,
    CANT_PUESTOS NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    
    CONSTRAINT  PK_SUCURSAL_MESA FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    primary key(ID_SUCURSAL,NUMERO),

    CONSTRAINT UQ_ID_MESA UNIQUE(ID),
    CONSTRAINT CH_NUMERO CHECK(NUMERO > 0),
    CONSTRAINT CH_CANT_PUESTOS CHECK(CANT_PUESTOS > 0)
);

CREATE SEQUENCE SEQ_MESA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--RESERVA
CREATE TABLE RESERVA(
    ID NUMBER PRIMARY KEY NOT NULL,
    FECHA_RESERVA FECHA , --OJO
    ABONO MONTO , --OJO
    CANT_PERSONAS NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    ID_CLIENTE NUMBER NOT NULL,

    CONSTRAINT  FK_SUCURSAL_RESERVA FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    CONSTRAINT  FK_CLIENTE_RESERVA FOREIGN KEY (ID_CLIENTE) REFERENCES PERSONA(CEDULA),

    CONSTRAINT CH_CANT_PERSONAS CHECK (CANT_PERSONAS > 0)
);

CREATE SEQUENCE SEQ_RESERVA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------VERIFICAR SI LAS LLAVES PRIMARIAS SE COLOCARON BIEN
--MESA RESERVADA
CREATE TABLE MESA_RESERVADA(
    ID NUMBER NOT NULL,
    ID_RESERVA NUMBER NOT NULL,
    ID_MESA NUMBER NOT NULL,
    ID_SUCURSAL NUMBER NOT NULL,
    
    CONSTRAINT  PK_RESERVA_M_RESERVADA FOREIGN KEY (ID_RESERVA) REFERENCES RESERVA(ID),
    CONSTRAINT  PK_MESA_M_RESERVADA FOREIGN KEY (ID_MESA) REFERENCES MESA(ID),
    CONSTRAINT  FK_SURCURSAL_M_RESERVADA FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),

    primary key(ID_MESA,ID_RESERVA),
    CONSTRAINT UQ_ID_MESA_RESER UNIQUE(ID)
);

CREATE SEQUENCE SEQ_MESA_RESERVADA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--CONTABILIDAD
CREATE TABLE CONTABILIDAD (
    ID NUMBER PRIMARY KEY NOT NULL,
    MONTO NUMBER NOT NULL,
    FECHA_RESERVA FECHA , --OJO
    ACUMULADO ACUMULADO, --OJO
    ID_SUCURSAL NUMBER NOT NULL,
    
    CONSTRAINT  FK_SUCURSAL_CONTABILIDAD FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID)
    -- CONSTRAINT CH_MONTO CHECK(MONTO > 0) ACA PUEDEN HABER NUMERO NEGATIVOS
);

CREATE SEQUENCE SEQ_CONTABILIDAD --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo


---------------------------------------------------------
--COMPRA
CREATE TABLE COMPRA(
    ID NUMBER PRIMARY KEY NOT NULL,
    FECHA_COMPRA FECHA, ----OJO
    TOTAL MONTO, ----OJOJ
    ID_SUCURSAL NUMBER NOT NULL,
    ID_CLIENTE NUMBER NOT NULL,
    
    CONSTRAINT  FK_SUCURSAL_COMPRA FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    CONSTRAINT  FK_CLIENTE_COMPRA FOREIGN KEY (ID_CLIENTE) REFERENCES PERSONA(CEDULA)
);

CREATE SEQUENCE SEQ_COMPRA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--PAGO
CREATE TABLE PAGO(
    ID NUMBER PRIMARY KEY NOT NULL,
    MONTO MONTO,   ---OJO
    FORMA_PAGO VARCHAR(20) NOT NULL,
    ID_COMPRA NUMBER NOT NULL,
    
    CONSTRAINT  FK_COMPRA_PAGO FOREIGN KEY (ID_COMPRA) REFERENCES COMPRA(ID),

    CONSTRAINT CH_FORMA_PAGO CHECK (FORMA_PAGO = 'Efectivo' OR FORMA_PAGO = 'POS' OR FORMA_PAGO = 'Zelle' OR FORMA_PAGO = 'Pipol' 
    OR FORMA_PAGO = 'Pay' OR FORMA_PAGO = 'PayPal' OR FORMA_PAGO = 'Zinli' OR FORMA_PAGO = 'Criptomonedas') --Aca se puede cambiar o agregar tipo de unidad
);

CREATE SEQUENCE SEQ_PAGO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--CONSUMO
CREATE TABLE CONSUMO(
    ID NUMBER PRIMARY KEY NOT NULL,
    UBICACION VARCHAR(30) NULL,
    TIPO VARCHAR(20) NOT NULL,
    MAPA BLOB DEFAULT EMPTY_BLOB(),
    FECHA_CONSUMO FECHA, -------OJO
    ID_SUCURSAL NUMBER NOT NULL, 
    ID_COMPRA NUMBER NULL,
    ID_CLIENTE NUMBER NOT NULL,
    ID_MESA NUMBER NULL,

    
    CONSTRAINT  FK_SUCURSAL_CONSUMO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID),
    CONSTRAINT  FK_COMPRA_CONSUMO FOREIGN KEY (ID_COMPRA) REFERENCES COMPRA(ID),
    CONSTRAINT  FK_CLIENTE_CONSUMO FOREIGN KEY (ID_CLIENTE) REFERENCES PERSONA(CEDULA),
    CONSTRAINT  FK_MESA_CONSUMO FOREIGN KEY (ID_MESA) REFERENCES MESA(ID),

    CONSTRAINT CH_TIPO_CONSUMO CHECK (TIPO = 'Local' OR TIPO = 'Pick-Up' OR TIPO = 'Delivery')
);

CREATE SEQUENCE SEQ_CONSUMO  --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--RECETA
CREATE TABLE RECETA(
    ID NUMBER PRIMARY KEY NOT NULL,
    CANTIDAD NUMBER NOT NULL,
    ID_PLATO NUMBER NOT NULL,
    ID_PRODUCTO NUMBER NOT NULL,
    
    CONSTRAINT  FK_PLATO_RECETA FOREIGN KEY (ID_PLATO) REFERENCES PLATO(ID),
    CONSTRAINT  FK_PRODUCTO_RECETA FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID),

    CONSTRAINT CH_CANTIDAD CHECK (CANTIDAD > 0)
);

CREATE SEQUENCE SEQ_RECETA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--PLATO CONSUMIDO
CREATE TABLE PLATO_CONSUMIDO(
    ID NUMBER PRIMARY KEY NOT NULL,
    ID_PLATO NUMBER NOT NULL,
    ID_CONSUMO NUMBER NOT NULL,
    
    CONSTRAINT  FK_PLATO_P_CONSUMIDO FOREIGN KEY (ID_PLATO) REFERENCES PLATO(ID),
    CONSTRAINT  FK_CONSUMO_P_CONSUMIDO  FOREIGN KEY (ID_CONSUMO) REFERENCES CONSUMO(ID)
);

CREATE SEQUENCE SEQ_PLATO_CONSUMIDO --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--PLATO DIA
CREATE TABLE PLATO_DIA(
    ID NUMBER PRIMARY KEY NOT NULL,
    FECHA_PLA_DIA FECHA,   ------OJO
    ID_PLATO NUMBER NOT NULL,

    CONSTRAINT  FK_PLATO_P_DIA FOREIGN KEY (ID_PLATO) REFERENCES PLATO(ID)
);

CREATE SEQUENCE SEQ_PLATO_DIA --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

---------------------------------------------------------
--PROMOCION
CREATE TABLE PROMOCION(
    ID NUMBER PRIMARY KEY NOT NULL,
    DESCRIPCION VARCHAR(50) NOT NULL,
    DESCUENTO NUMBER NOT NULL,
    PRECIO_FIN MONTO, -----OJO
    FECHA_PROMO  FECHA,    ---OJO
    ID_PLATO NUMBER NOT NULL,

    CONSTRAINT  FK_PLATO_PROMO FOREIGN KEY (ID_PLATO) REFERENCES PLATO(ID),
    CONSTRAINT CH_DESCUENTO CHECK (DESCUENTO IN (5,10,20,30,40,50,60,70,80,90,100))
);

CREATE SEQUENCE SEQ_PROMOCION --nombre de la secuencia
START WITH 1 --la secuencia empieza por 1
INCREMENT BY 1 --se incrementa de uno en uno
NOMAXVALUE; --no tiene valor maximo

--*************************************************************************CREACION DE LAS TABLAS*************************************************************************--

--******************************************************************  DROPS DE LAS TABLAS Y SECUENCIAS********************************************************************--

drop table "USER_PROYECTO"."RESTAURANTE" cascade constraints PURGE;
drop table "USER_PROYECTO"."SUCURSAL" cascade constraints PURGE;
drop table "USER_PROYECTO"."PRODUCTO" cascade constraints PURGE;
drop table "USER_PROYECTO"."INVENTARIO" cascade constraints PURGE;
drop table "USER_PROYECTO"."GRUPO" cascade constraints PURGE;
drop table "USER_PROYECTO"."EVENTO" cascade constraints PURGE;
drop table "USER_PROYECTO"."PERSONA" cascade constraints PURGE;
drop table "USER_PROYECTO"."EMPLEADO" cascade constraints PURGE;
drop table "USER_PROYECTO"."PLATO" cascade constraints PURGE;
drop table "USER_PROYECTO"."ENCUESTA" cascade constraints PURGE;
drop table "USER_PROYECTO"."ROL" cascade constraints PURGE;
drop table "USER_PROYECTO"."PUESTO" cascade constraints PURGE;
drop table "USER_PROYECTO"."MESA" cascade constraints PURGE;
drop table "USER_PROYECTO"."RESERVA" cascade constraints PURGE;
drop table "USER_PROYECTO"."MESA_RESERVADA" cascade constraints PURGE;
drop table "USER_PROYECTO"."CONTABILIDAD" cascade constraints PURGE;
drop table "USER_PROYECTO"."COMPRA" cascade constraints PURGE;
drop table "USER_PROYECTO"."PAGO" cascade constraints PURGE;
drop table "USER_PROYECTO"."RECETA" cascade constraints PURGE;
drop table "USER_PROYECTO"."CONSUMO" cascade constraints PURGE;
drop table "USER_PROYECTO"."PLATO_CONSUMIDO" cascade constraints PURGE;
drop table "USER_PROYECTO"."PLATO_DIA" cascade constraints PURGE;
drop table "USER_PROYECTO"."PROMOCION" cascade constraints PURGE;


 drop sequence SEQ_SUCURSAL;
 drop sequence SEQ_INVENTARIO;
 drop sequence SEQ_EVENTO;
 drop sequence SEQ_GRUPO;
 drop sequence SEQ_EVENTO;
 drop sequence SEQ_EMPLEADO;
 drop sequence SEQ_PUESTO;
 drop sequence SEQ_ROL;
 drop sequence SEQ_RESERVA;
 drop sequence SEQ_MESA_RESERVADA;
 drop sequence SEQ_MESA;
 drop sequence SEQ_CONTABILIDAD;
 drop sequence SEQ_RESTAURANTE;
 drop sequence SEQ_CONSUMO;
 drop sequence SEQ_RECETA;
 drop sequence SEQ_PLATO;
 drop sequence SEQ_PLATO_CONSUMIDO;
 drop sequence SEQ_PLATO_DIA;
 drop sequence SEQ_PROMOCION;
drop sequence SEQ_COMPRA;
drop sequence SEQ_PAGO;
drop sequence SEQ_PRODUCTO;
drop sequence SEQ_ENCUESTA;


--******************************************************************  DROPS DE LAS TABLAS Y SECUENCIAS********************************************************************--





--VERIFICAR SI SE PUEDE CAMBIAR ESTE FORMATO DENTRO DE UN PROCEDURE OJO
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';





