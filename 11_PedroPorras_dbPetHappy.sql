------ Creamos la base de datos dbPetHappy ------
CREATE DATABASE dbPetHappy
GO


-- Ponemos en uso la base de datos dbPetHappy
USE dbPetHappy
GO


-- Creamos la tabla CLIENTE
CREATE TABLE CLIENTE (
    CODCLI char(7)  NOT NULL,
    DNICLI char(9)  NOT NULL,
    NOMCLI varchar(40)  NOT NULL,
    APECLI varchar(40)  NOT NULL,
    DIRECLI varchar(60)  NOT NULL,
    TELECLI char(9)  NOT NULL,
	EMACLI varchar(60) NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (CODCLI)
)
GO

-- Creamos la tabla EMPLEADO
CREATE TABLE EMPLEADO (
    CODEMP char(6)  NOT NULL,
    DNIEMP char(9)  NOT NULL,
    NOMEMP varchar(40)  NOT NULL,
    APEMP varchar(40)  NOT NULL,
    DIREMP varchar(60)  NOT NULL,
    TELEMP char(9)  NOT NULL,
	EMAEMP varchar(60) NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (CODEMP)
)
GO

-- Creamos la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    CODPRO char(7)  NOT NULL,
    NOMPRO varchar(30)  NOT NULL,
    MARPRO varchar(20)  NOT NULL,
    PREPRO decimal(8,2)  NOT NULL,
    STOPRO int  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (CODPRO)
)
GO

-- Creamos la tabla UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPUBI varchar(80)  NOT NULL,
    PROVUBI char(80)  NOT NULL,
    DISTUBI varchar(80)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
)
GO

-- Creamos la tabla USUARIO
CREATE TABLE USUARIO (
    IDUSU int  NOT NULL IDENTITY(1,1),
    NAMEUSU varchar(40)  NOT NULL,
    PASSUSU varchar(40)  NOT NULL,
    CODCLI char(7)  NULL,
    CODEMP char(6)  NULL,
    CONSTRAINT USUARIO_pk PRIMARY KEY  (IDUSU)
)
GO

-- Creamos la tabla VENTA
CREATE TABLE VENTA (
    IDVENT int  NOT NULL IDENTITY(1,1),
    CODEMP char(6)  NOT NULL,
    CODCLI char(7)  NOT NULL,
    DIRECVENT varchar(60)  NOT NULL,
    FECHVENT date  NOT NULL DEFAULT GETDATE(),
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVENT)
)
GO

-- Creamos la tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int NOT NULL IDENTITY(1,1),
    IDVENT int  NOT NULL,
    CODPRO char(7)  NOT NULL,
    CANTVENDET int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
)
GO


------ Relacionamos la tablas ------


--Relacionamos CLIENTE <- UBIGEO
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI)
GO

--Relacionamos EMPLEADO <- UBIGEO
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI)
GO

--Relacionamos USUARIO <- CLIENTE
ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_CLIENTE
    FOREIGN KEY (CODCLI)
    REFERENCES CLIENTE (CODCLI)
GO

--Relacionamos USUARIO <- EMPLEADO
ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_EMPLEADO
    FOREIGN KEY (CODEMP)
    REFERENCES EMPLEADO (CODEMP)
GO

--Relacionamos VENTA <- CLIENTE
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (CODCLI)
    REFERENCES CLIENTE (CODCLI)
GO

--Relacionamos VENTA_DETALLE <- PRODUCTO
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (CODPRO)
    REFERENCES PRODUCTO (CODPRO)
GO

--Relacionamos VENTA_DETALLE <- VENTA
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVENT)
    REFERENCES VENTA (IDVENT)
GO

--Relacionamos VENTA <- EMPLEADO
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (CODEMP)
    REFERENCES EMPLEADO (CODEMP)
GO



------ Insercion de datos dbPetHappy ------

--Insertar registros en la tabla UBIGEO
INSERT INTO Ubigeo
(CODUBI, DEPUBI, PROVUBI, DISTUBI)
VALUES
('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
('140402', 'Lima', 'Cañete', 'Calango'),
('140403', 'Lima', 'Cañete', 'Cerro Azul'),
('140404', 'Lima', 'Cañete', 'Coayllo'),
('140405', 'Lima', 'Cañete', 'Chilca'),
('140406', 'Lima', 'Cañete', 'Imperial'),
('140407', 'Lima', 'Cañete', 'Lunahuaná'),
('140408', 'Lima', 'Cañete', 'Mala'),
('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
('140410', 'Lima', 'Cañete', 'Pacarán'),
('140411', 'Lima', 'Cañete', 'Quilmaná'),
('140412', 'Lima', 'Cañete', 'San Antonio'),
('140413', 'Lima', 'Cañete', 'San Luis'),
('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores'),
('140415', 'Lima', 'Cañete', 'Zúñiga'),
('140416', 'Lima', 'Cañete', 'Asia')
GO

--Insertar registros en la tabla CLIENTE
INSERT INTO CLIENTE
(CODCLI, DNICLI, NOMCLI, APECLI, DIRECLI, TELECLI, EMACLI, CODUBI)
VALUES
('CL00001','45781233','Alicia','García Campos','Calle Grau','929185236','agarcia@gmail.com','140409'),
('CL00002','15487922','Juana','Ávila Chumpitaz','Calle BRAZIL','923568741','javila@gmail.com','140402'),
('CL00003','15253588','Oscar','Coronado Vásquez','km32','932615478','ocoronado@gmail.com','140403'),
('CL00004','85213566','Luis','Barrios Palomino','Al costado de mercado','932817645','lbarrios@outlook.com','140409'),
('CL00005','15482566','María','Tarazona Mendoza','Calle Esperanza','978400123','mtarazona@outlook.com','140407'),
('CL00006','15428211','Pedro','Sánchez Dávila','Calle las palmas','941533268','psanchez@yahoo.com','140402'),
('CL00007','47129533','Aldo','Torres Zavala','Numero 34 Anexo','958866221','atorres@yahoo.com','140405'),
('CL00008','48171533','Fiorella','Monteza Alzamora','Tienda Beto Puerta azul','992255441','fmonteza@gmail.com','140408'),
('CL00009','15429866','Gloria','Linares Rodríguez','Al costado de ferreteria Oliver','954415950','glinares@hotmail.com','140403'),
('CL00010','85251592','Esperanza','Stark Parker','Calle Grau','901133258','estark@yahoo.com','140405')
GO


--Insertar registros en la tabla EMPLEADO
INSERT INTO EMPLEADO
(CODEMP, DNIEMP, NOMEMP, APEMP, DIREMP, TELEMP, EMAEMP, CODUBI)
VALUES
('EM0001','45781213','Max','García Saldaña','Calle Grau','929125236','max@gmail.com','140409'),
('EM0002','15487242','Juana','Sanchez Chumpitaz','Calle BRAZIL','926768741','jsanchez@gmail.com','140402'),
('EM0003','15285788','Oscar','Ruiz Vásquez','km32','932895478','oruiz@gmail.com','140403')
GO

--Insertar registros en la tabla PRODUCTO
INSERT INTO PRODUCTO
(CODPRO, NOMPRO, MARPRO, PREPRO, STOPRO)
VALUES
('PR00001','Royal Canin MAXI','ROYAL CANIN','97.00','30'),
('PR00002','Royal Canin Medium','ROYAL CANIN','43.00','30'),
('PR00003','Pack Perro Pupi','ROYAL CANIN','12.00','30'),
('PR00004','Active 7+','ROYAL CANIN','78.00','30'),
('PR00005','ProPlan AdultoCarne Pouch','PRO PLAN','56.00','30'),
('PR00006','ProPlan Kitten Pouch','PRO PLAN','24.00','30'),
('PR00007','ProPlan Urinary Cat','PRO PLAN','61.00','30'),
('PR00009','Monge Sterilised Chicken','Monge','23.00','30'),
('PR00010','Monge Mini Adulto Chicken','Monge','42.00','30')
GO
