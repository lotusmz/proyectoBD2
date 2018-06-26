--************************************** [RECURSOS]
CREATE TABLE RECURSOS
(
 --Tipos de recurso
 NOMBRE       VARCHAR2(20) NOT NULL ,
 EXISTENCIA   NUMBER(38) NOT NULL , 
 RESERVA      NUMBER(38) NOT NULL ,
 VALOR        NUMBER(38,2) NOT NULL , 
 RESPALDO     VARCHAR2(20) NULL, 

 CONSTRAINT PK_RECURSOS PRIMARY KEY (NOMBRE),
 CONSTRAINT FK_RESPALDO_RECURSOS FOREIGN KEY (RESPALDO)REFERENCES RECURSOS(NOMBRE)

);
--************************************** [TROPAS]
CREATE TABLE TROPAS
(
 --Tipos de tropa
 NOMBRE    VARCHAR2(20) NOT NULL ,
 PUNTOS    NUMBER(38) NOT NULL ,
 TIPO      CHAR(3) NOT NULL, -- ATQ/DEF
 CORONAS    NUMBER(38) NOT NULL ,
 CONSTRAINT PK_TROPAS PRIMARY KEY (NOMBRE)
);
--************************************** [VALORES_POR_TROPAS]
CREATE TABLE VALORES_POR_TROPAS
(
 --Cuanto de un recurso cuesta una tropa en particular
 NOMBRE_TROPA      VARCHAR2(20) NOT NULL ,
 NOMBRE_RECURSO    VARCHAR2(20) NOT NULL,
 CANTIDAD          NUMBER(38) NOT NULL ,
 
 CONSTRAINT PK_VALORES_POR_TROPAS PRIMARY KEY (NOMBRE_TROPA, NOMBRE_RECURSO),
 CONSTRAINT FK_VALORES_POR_TROPAS_TROPAS FOREIGN KEY (NOMBRE_TROPA)REFERENCES TROPAS(NOMBRE),
 CONSTRAINT FK_VALORES_POR_TROPAS_RECURSOS FOREIGN KEY (NOMBRE_RECURSO) REFERENCES RECURSOS(NOMBRE)
);

--************************************** [REINOS]

CREATE TABLE REINOS
(
 NOMBRE       VARCHAR2(20) NOT NULL ,
 LOGOTIPO     VARCHAR2(2000) NOT NULL ,
 MES          CHAR(3) NOT NULL ,
 CANT_CORONAS NUMBER(38) DEFAULT 0 NOT NULL ,
 PTS_DEF      NUMBER(38) DEFAULT 0 NOT NULL ,
 PTS_ATQ      NUMBER(38) DEFAULT 0 NOT NULL ,
 CONSTRAINT PK_REINOS PRIMARY KEY (NOMBRE)
);
--************************************** [TROPAS_POR_REINOS]
CREATE TABLE TROPAS_POR_REINOS
(
--Cuantas de cada tropa tiene cada reino
 NOMBRE_TROPA      VARCHAR2(20) NOT NULL ,
 NOMBRE_REINO      VARCHAR2(20) NOT NULL,
 CANTIDAD          NUMBER(38) NOT NULL ,
 
 CONSTRAINT PK_TROPAS_POR_REINOS PRIMARY KEY (NOMBRE_TROPA, NOMBRE_REINO),
 CONSTRAINT FK_TROPAS_POR_REINOS_TROPAS FOREIGN KEY (NOMBRE_TROPA)REFERENCES TROPAS(NOMBRE),
 CONSTRAINT FK_TROPAS_POR_REINOS_REINOS FOREIGN KEY (NOMBRE_REINO) REFERENCES REINOS(NOMBRE)
);
--************************************** [RECURSOS_POR_REINOS]
CREATE TABLE RECURSOS_POR_REINOS
(
 NOMBRE_REINO VARCHAR2(20) NOT NULL ,
 NOMBRE_RECURSO VARCHAR2(20) NOT NULL ,
 CANTIDAD  NUMBER(38) NOT NULL ,
 CONSTRAINT PK_RECURSOS_POR_REINOS PRIMARY KEY (NOMBRE_REINO, NOMBRE_RECURSO),
 CONSTRAINT FK_RECURSOS_POR_REINOS_REINOS FOREIGN KEY (NOMBRE_REINO)REFERENCES REINOS(NOMBRE),
 CONSTRAINT FK_RECURSOS_PR_REINOS_RECURSOS FOREIGN KEY (NOMBRE_RECURSO) REFERENCES RECURSOS(NOMBRE)
);

--************************************** [BITACORAS]

CREATE TABLE BITACORAS
(
 NOMBRE_REINO VARCHAR2(20) NOT NULL ,
 FECHA_Y_HORA DATE DEFAULT SYSDATE NOT NULL ,
 RECURSOS     VARCHAR(2000) NOT NULL ,
 CORONAS      NUMBER(38) NOT NULL ,
 TRANSACCION  CHAR(3) NOT NULL ,

 CONSTRAINT PK_BITACORA PRIMARY KEY (NOMBRE_REINO, FECHA_Y_HORA),
 CONSTRAINT FK_REINOS_BITACORAS FOREIGN KEY (NOMBRE_REINO)
  REFERENCES REINOS(NOMBRE)
);

/*
DROP TABLE TROPAS_POR_REINOS;
DROP TABLE RECURSOS_POR_REINOS;
DROP TABLE VALORES_POR_TROPAS;
DROP TABLE RECURSOS;
DROP TABLE TROPAS;
DROP TABLE BITACORAS;
DROP TABLE REINOS;
*/

