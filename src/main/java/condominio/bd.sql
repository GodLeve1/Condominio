/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Richard
 * Created: 16 feb 2024
 */
create database condominio;
use condominio;

CREATE TABLE Usuario (
  id_usuario int,
  usuario varchar(50) NOT NULL,
  contrasenia varchar(50) NOT NULL,
  nombre varchar(10) NOT NULL,
  apellido varchar(100) NOT NULL,
  email varchar(10) NOT NULL,
  tipoUsuario int DEFAULT NULL,
  PRIMARY KEY (id_usuario)
);

/*===============================================================================================*/
/*=========================TABLAS USADAS POR MODULO FINANZAS GRUPO 1=============================*/
/*===============================================================================================*/
CREATE TABLE METODOPAGO
(
   ID_METODOPAGO        INT NOT NULL AUTO_INCREMENT,
   NOMBRE_METODOPAGO    VARCHAR(20) NOT NULL,
   PRIMARY KEY (ID_METODOPAGO)
); 

CREATE TABLE USUARIO
(
   ID_USUARIO           VARCHAR(20) NOT NULL,
   NOMBRE_USUARIO       VARCHAR(20),
   APELLIDO_USUARIO     VARCHAR(20),
   DIRECCION_USUARIO    VARCHAR(20),
   CORREOELECTRONICO_USUARIO VARCHAR(100),
   TELEFONO_USUARIO     VARCHAR(20),
   TIPO_USUARIO         VARCHAR(20),
   PRIMARY KEY (ID_USUARIO)
); 

CREATE TABLE CONDOMINIO_F
(
   ID_CONDOMINIO_F        INT NOT NULL AUTO_INCREMENT,
   NOMBRE_CONDOMINIO_F    VARCHAR(50) NOT NULL,
   PRIMARY KEY (ID_CONDOMINIO_F)
);

CREATE TABLE DEPARTAMENTO_F
(
   ID_DEPARTAMENTO_F      INT NOT NULL AUTO_INCREMENT,
   NUMERO_DEPARTAMENTO_F  VARCHAR(20) NOT NULL,
   ID_USUARIO           VARCHAR(20) NOT NULL,
   ID_CONDOMINIO_F        INT NOT NULL,
   PRIMARY KEY (ID_DEPARTAMENTO_F),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
   FOREIGN KEY (ID_CONDOMINIO_F) REFERENCES CONDOMINIO_F(ID_CONDOMINIO_F)
);


CREATE TABLE PAGO
(
   ID_PAGOS             INT NOT NULL AUTO_INCREMENT,
   ID_METODOPAGO        INT NOT NULL,
   ID_USUARIO           VARCHAR(20) NOT NULL,
   FECHA_PAGO           DATE NOT NULL,
   MONTO_PAGO           FLOAT(10,2) NOT NULL,
   TIPO_PAGO            VARCHAR(60) NOT NULL,				 	/*--3 TIPOS DE INGRESO: EGRESO ORDINARIO, INGRESO EXTRAORDINARIO, INGRESO ORDINARIO*/
   FECHAVENCIMIENTO_PAGO DATE NOT NULL,
   ESTADO_PAGO          VARCHAR(10) NOT NULL,		 			/*2 ESTADOS: VIGENTE, ANULADO*/
   DESCRIPCION			VARCHAR(200) default 'ORDINARIO',		/*SOLO EXTRAORDINARIOS DEBEN ESPECIFICAR*/
   PRIMARY KEY (ID_PAGOS),
   FOREIGN KEY (ID_METODOPAGO) REFERENCES METODOPAGO(ID_METODOPAGO),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE CUOTA 												/*SI UN PAGO SE ANULA LAS CUOTAS SE ELIMINAN*/
(
   ID_PAGOS             INT NOT NULL,
   ID_CUOTA             INT NOT NULL AUTO_INCREMENT,
   NUM_CUOTA            INT NOT NULL,
   MONTO_CUOTA          FLOAT(10,2) NOT NULL,
   FECHAV_CUOTA         DATE NOT NULL,
   ESTADO_CUOTA         CHAR(20) NOT NULL,  					/*2 ESTADOS: PENDIENTE O PAGADO*/
   PRIMARY KEY (ID_CUOTA),
   FOREIGN KEY (ID_PAGOS) REFERENCES PAGO(ID_PAGOS)
);


-- Insertar registros en la tabla METODOPAGO
INSERT INTO METODOPAGO (NOMBRE_METODOPAGO) VALUES
('Efectivo'),
('Tarjeta de crédito'),
('Transferencia'),
('PayPal'),
('Cheque'),
('Criptomoneda'),
('Pago móvil'),
('Vale de comida'),
('Cuenta corriente'),
('Tarjeta de débito');

-- Insertar registros en la tabla USUARIO
INSERT INTO USUARIO (ID_USUARIO, NOMBRE_USUARIO, APELLIDO_USUARIO, DIRECCION_USUARIO, CORREOELECTRONICO_USUARIO, TELEFONO_USUARIO, TIPO_USUARIO) VALUES
('USR001', 'Juan', 'Perez', 'Calle 123', 'juan@example.com', '123456789', 'PROPIETARIO'),
('USR002', 'Maria', 'Lopez', 'Avenida 456', 'maria@example.com', '987654321', 'INQUILINO'),
('USR003', 'Pedro', 'Garcia', 'Plaza Principal', 'pedro@example.com', '456789123', 'PROPIETARIO'),
('USR004', 'Ana', 'Martinez', 'Calle 789', 'ana@example.com', '741852963', 'INQUILINO'),
('USR005', 'Carlos', 'Sanchez', 'Avenida Central', 'carlos@example.com', '159263478', 'PROPIETARIO'),
('USR006', 'Laura', 'Rodriguez', 'Carrera 10', 'laura@example.com', '369852147', 'INQUILINO'),
('USR007', 'Diego', 'Gomez', 'Calle 246', 'diego@example.com', '258741369', 'PROPIETARIO'),
('USR008', 'Sofia', 'Diaz', 'Avenida Norte', 'sofia@example.com', '147258369', 'INQUILINO'),
('USR009', 'Alejandro', 'Hernandez', 'Calle Sur', 'alejandro@example.com', '123789456', 'PROPIETARIO'),
('USR010', 'Fernanda', 'Torres', 'Avenida Este', 'fernanda@example.com', '987654321', 'INQUILINO');

-- Insertar registros en la tabla CONDOMINIO_F
INSERT INTO CONDOMINIO_F (NOMBRE_CONDOMINIO_F) VALUES
('Edificio A'),
('Conjunto Residencial B'),
('Torres del Parque'),
('Residencial La Floresta'),
('CONDOMINIO_F El Bosque'),
('Urbanización El Recreo'),
('Complejo Los Pinos'),
('Conjunto Vista Hermosa'),
('Residencial Los Alamos'),
('CONDOMINIO_F Las Palmas');

-- Insertar registros en la tabla DEPARTAMENTO_F
-- Se asumirá que ID_USUARIO y ID_CONDOMINIO_F se asignan aleatoriamente de los datos disponibles en las tablas correspondientes.
INSERT INTO DEPARTAMENTO_F (NUMERO_DEPARTAMENTO_F, ID_USUARIO, ID_CONDOMINIO_F) VALUES
('101', 'USR001', 1),
('202', 'USR002', 2),
('303', 'USR003', 3),
('404', 'USR004', 4),
('505', 'USR005', 5),
('606', 'USR006', 6),
('707', 'USR007', 7),
('808', 'USR008', 8),
('909', 'USR009', 9),
('1010', 'USR010', 10);

SELECT * FROM USUARIO;
SELECT * FROM CUOTA;
SELECT * FROM PAGO;
SELECT * FROM DEPARTAMENTO_F;
SELECT * FROM CONDOMINIO_F;
/*===============================================================================================*/
/*=========================TABLAS USADAS POR MODULO RESERVAS GRUPO 4=============================*/
/*===============================================================================================*/
DROP TABLE IF EXISTS RESERVA;
DROP TABLE IF EXISTS AREACOMUN;

/*=====================ÁREAS COMUNES=====================*/
CREATE TABLE AREACOMUN (
    NOMBRE_AREA VARCHAR(100) PRIMARY KEY,
    ESTADO_AREA ENUM('DISPONIBLE', 'OCUPADO'),
    HORA_INICIO TIME,
    HORA_FIN TIME
);

-- Insertar registros en la tabla AREACOMUN
INSERT INTO AREACOMUN (NOMBRE_AREA, ESTADO_AREA, HORA_INICIO, HORA_FIN) 
VALUES 
('Área de Picnic', 'DISPONIBLE', '00:00:00', '00:00:00'),
('Canchas Múltiples', 'DISPONIBLE', '00:00:00', '00:00:00'),
('Gimnasio', 'OCUPADO', '7:00:00', '13:00:00');

/*=====================RESERVA=====================*/
CREATE TABLE RESERVA (
    ID_RESERVA INT AUTO_INCREMENT PRIMARY KEY,
    AREA_RESERVADA VARCHAR(100),
    FECHA_RESERVA DATE,
    HORA_RESERVA TIME,
    DURACION INT,
    ESTADO_RESERVA ENUM('PROCESADA', 'EN ESPERA', 'CANCELADA'),
    CANCELADO BIT,
    FOREIGN KEY (AREA_RESERVADA) REFERENCES AREACOMUN(NOMBRE_AREA)
);

-- Insertar registros en la tabla RESERVA
INSERT INTO RESERVA (AREA_RESERVADA, FECHA_RESERVA, HORA_RESERVA, DURACION, ESTADO_RESERVA, CANCELADO) 
VALUES 
('Área de Picnic', '2024-02-20', '10:00:00', 2, 'EN ESPERA', 0),
('Canchas Múltiples', '2024-02-21', '11:30:00', 1, 'PROCESADA', 0),
('Gimnasio', '2024-02-22', '14:00:00', 3, 'CANCELADA', 1);

SELECT * FROM AREACOMUN;
SELECT * FROM RESERVA;

/*===============================================================================================*/
/*=========================TABLAS USADAS POR MODULO RESERVAS GRUPO 6=============================*/
/*===============================================================================================*/

-- Drop tables if they already exist
/*DROP TABLE IF EXISTS Comunicado;*/
/*DROP TABLE IF EXISTS Anuncios_Generales;*/

-- Creating table Anuncios_Generales
CREATE TABLE Anuncios_Generales (
    ID_AnunciosGenerales INT PRIMARY KEY,
    ID_Administrador INT,
    ID_Usuario INT,
    Fecha_Anuncio DATE,
    Titulo_Anuncio VARCHAR(50),
    Descripcion_Anuncio VARCHAR(150),
    FOREIGN KEY (ID_Administrador) REFERENCES Administrador(ID_Administrador),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Creating table Comunicado
CREATE TABLE Comunicado (
    ID_Comunicado INT PRIMARY KEY,
    ID_Administrador INT,
    ID_Usuario INT,
    Fecha_Comunicado DATE,
    Titulo_Comunicado VARCHAR(50),
    Descripcion_Comunicado VARCHAR(150),
    FOREIGN KEY (ID_Administrador) REFERENCES Administrador(ID_Administrador),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Generar e insertar datos aleatorios para la tabla Anuncios_Generales
INSERT INTO Anuncios_Generales (ID_AnunciosGenerales, ID_Administrador, ID_Usuario, Fecha_Anuncio, Titulo_Anuncio, Descripcion_Anuncio)
VALUES 
(1, 1, 2, '2024-02-17', 'Nuevo horario de atención', 'Se informa a todos los usuarios que a partir del día de mañana el horario de atención será de 8:00 a.m. a 5:00 p.m.'),
(2, 2, 4, '2024-02-17', 'Cambio de ubicación de la oficina', 'Por motivos de remodelación, la oficina se trasladará temporalmente a la siguiente dirección: Calle Principal #123.'),
(3, 3, 1, '2024-02-17', 'Suspensión de servicio de agua', 'Se comunica a los usuarios que el servicio de agua estará suspendido el próximo sábado debido a trabajos de mantenimiento.'),
(4, 4, 3, '2024-02-17', 'Reunión de condominio', 'Recordatorio: La reunión de condominio se llevará a cabo el próximo viernes a las 7:00 p.m. en el salón comunal.'),
(5, 5, 5, '2024-02-17', 'Nueva política de seguridad', 'A partir del mes próximo, se implementará una nueva política de seguridad en el edificio. Se solicita la cooperación de todos los residentes.');

-- Generar e insertar datos aleatorios para la tabla Comunicado
INSERT INTO Comunicado (ID_Comunicado, ID_Administrador, ID_Usuario, Fecha_Comunicado, Titulo_Comunicado, Descripcion_Comunicado)
VALUES 
(1, 2, 3, '2024-02-17', 'Recordatorio de pago de expensas', 'Se recuerda a todos los residentes que el plazo para el pago de expensas vence el próximo viernes.'),
(2, 3, 5, '2024-02-17', 'Fiesta de fin de año', 'Estimados residentes, les informamos que la fiesta de fin de año se llevará a cabo el sábado 20 de diciembre en la terraza del edificio.'),
(3, 4, 2, '2024-02-17', 'Cierre temporal de parqueadero', 'Por motivos de mantenimiento, el parqueadero estará cerrado desde el lunes hasta el miércoles de la próxima semana.'),
(4, 5, 4, '2024-02-17', 'Horario especial de atención', 'Durante la temporada navideña, la administración estará atendiendo en horario extendido.'),
(5, 1, 1, '2024-02-17', 'Asamblea extraordinaria', 'Se convoca a todos los propietarios a una asamblea extraordinaria que se llevará a cabo el próximo domingo a las 10:00 a.m.');


/*===============================================================================================*/
/*=========================TABLAS USADAS POR MODULO INMUEBLES GRUPO 3=============================*/
/*===============================================================================================*/

DROP Table IF EXISTS CLIENTE;

/*=====================CLIENTE=====================*/
CREATE TABLE CLIENTE (
    ID INT IDENTITY PRIMARY KEY,
    CI VARCHAR(10),
    Nombre VARCHAR(100),
    Tipo VARCHAR(100),
    Estado VARCHAR(20),
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Observaciones VARCHAR(255)
);

INSERT INTO CLIENTE (CI, Nombre, Tipo, Estado, Fecha_Inicio, Fecha_Fin, Observaciones)
VALUES
('1234567890', 'Juan Pérez', 'Apartamento', 'Reservado', '2024-02-12', '2024-02-15', 'Reserva confirmada'),
('9876543210', 'Ana García', 'Casa', 'No Reservado', '2024-02-15', '2024-02-29', 'Pago pendiente'),
('5678901234', 'Carlos Rodríguez', 'Oficina', 'Reservado', '2024-02-20', '2024-02-25', 'Reserva temporal');

select *from CLIENTE;


/*=====================CATALOGO_CONDOMINIOS=====================*/
CREATE TABLE CATALOGO_CONDOMINIOS (
    ID INT IDENTITY PRIMARY KEY,
    Tipo VARCHAR(50),
    Estado VARCHAR(50),
    Dimension VARCHAR(50),
    Num_Habitaciones INT,
    Servicios VARCHAR(100),
    Normas VARCHAR(100)
);

INSERT INTO CATALOGO_CONDOMINIOS (Tipo, Estado, Dimension, Num_Habitaciones, Servicios, Normas)
VALUES 
('Apartamento', 'No reservado', 'Grande', 3, 'Piscina, Gimnasio', 'No fumar'),
('Casa', 'Reservado', 'Mediano', 2, 'Parque, Estacionamiento', 'No animales'),
('Casa', 'No reservado', 'Pequeño', 1, 'Piscina, Estacionamiento', 'No bicicletas'),
('Suit', 'Reservado', 'Grande', 4, 'Piscina, Jardín', 'No fiestas'),
('Apartamento', 'No reservado', 'Pequeño', 1, 'Gimnasio', 'No mascotas'),
('Apartamento', 'Reservado', 'Mediano', 2, 'Piscina', 'No fumar'),
('Casa', 'No reservado', 'Grande', 3, 'Parque, Piscina', 'No ruidos'),
('Suit', 'Reservado', 'Mediano', 2, 'Jardín', 'No animales');

Select *from CATALOGO_CONDOMINIOS


/*=====================GESTION_PROPIEDADES=====================*/
CREATE TABLE GESTION_PROPIEDADES (
	ID INT IDENTITY PRIMARY KEY,
    Cedula VARCHAR(20),
    Nombre VARCHAR(100),
    Bloque VARCHAR(50),
    Edificio VARCHAR(50),
    Piso VARCHAR(2),
    Departamento VARCHAR(50),
    Observaciones VARCHAR(200)
);


INSERT INTO GESTION_PROPIEDADES (Cedula, Nombre, Bloque, Edificio, Piso, Departamento, Observaciones)
VALUES
('1234567890', 'Juan Pérez', 'A', 'Torre 1', '4', '24', 'Puertas Rayadas'),
('2345678901', 'María González', 'B', 'Torre 2', '2', '13', 'Recien Pintado'),
('3456789012', 'Carlos Rodríguez', 'C', 'Torre 3', '3', '20', 'Amueblado'),
('4567890123', 'Ana Martínez', 'A', 'Torre 2', '1', '3', 'Demasiada Humedad'),
('5678901234', 'Laura López', 'B', 'Torre 1', '1', '2', 'Rota tuberia del agua'),
('6789012345', 'Pedro Sánchez', 'C', 'Torre 1', '3', '19', 'Sin Observacion');


Select *from GESTION_PROPIEDADES

/*=====================REPORTES=====================*/
CREATE TABLE REPORTES (
    ID INT IDENTITY PRIMARY KEY,
    Cedula VARCHAR(20),
    Nombre VARCHAR(100),
    Bloque_Anterior VARCHAR(50),
    Bloque_Actual VARCHAR(50),
    Edificio_Anterior VARCHAR(50),
    Edificio_Actual VARCHAR(50),
    Piso_Anterior VARCHAR(10),
    Piso_Actual VARCHAR(10),
    Departamento_Anterior VARCHAR(50),
    Departamento_Actual VARCHAR(50),
    Observacion_Anterior VARCHAR(200),
    Observacion_Actual VARCHAR(200)
);

INSERT INTO REPORTES (Cedula, Nombre, Bloque_Anterior, Bloque_Actual, Edificio_Anterior, Edificio_Actual, Piso_Anterior, Piso_Actual, Departamento_Anterior, Departamento_Actual, Observacion_Anterior, Observacion_Actual)
VALUES
('1234567890', 'Juan Pérez', 'A', NULL, 'Torre 1', NULL, '4', NULL, '24', NULL, 'Puertas Rayadas', NULL),
('2345678901', 'María González', 'B', NULL, 'Torre 2', NULL, '2', NULL, '13', NULL, 'Recien Pintado', NULL),
('3456789012', 'Carlos Rodríguez', 'C', NULL, 'Torre 3', NULL, '3', NULL, '20', NULL, 'Amueblado', NULL),
('4567890123', 'Ana Martínez', 'A', NULL, 'Torre 2', NULL, '1', NULL, '3', NULL, 'Demasiada Humedad', NULL),
('5678901234', 'Laura López', 'B', NULL, 'Torre 1', NULL, '1', NULL, '2', NULL, 'Rota tuberia del agua', NULL),
('6789012345', 'Pedro Sánchez', 'C', NULL, 'Torre 1', NULL, '3', NULL, '19', NULL, 'Sin Observacion', NULL);

Select *from REPORTES



/*=====================RESERVA=====================*/
DROP TABLE IF EXISTS RESERVA;

CREATE TABLE RESERVA (
	ID INT IDENTITY PRIMARY KEY,
    Cedula VARCHAR(10),
    Nombre VARCHAR(100),
    Tipo VARCHAR(100),
    Estado VARCHAR(20),
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Observaciones VARCHAR(255)
);

INSERT INTO RESERVA (Cedula, Nombre, Tipo, Estado, Fecha_Inicio, Fecha_Fin, Observaciones)
VALUES
('1234567890', 'Juan Pérez', 'Apartamento', 'Reservado', '2024-02-12', '2024-02-15', 'Reserva confirmada'),
('9876543210', 'Ana García', 'Casa', 'No Reservado', '2024-02-15', '2024-02-29', 'Pago pendiente'),
('5678901234', 'Carlos Rodríguez', 'Oficina', 'Reservado', '2024-02-20', '2024-02-25', 'Reserva temporal');

Select * from RESERVA