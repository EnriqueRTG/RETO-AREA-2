-- CREAR BASE DE DATOS 
CREATE DATABASE delitos_reto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE delitos_reto;

-- AREAS COMUNITARIAS 
CREATE TABLE Areas_comunitarias (
	Id_area_com INT AUTO_INCREMENT PRIMARY KEY,
	Nombre_area_com VARCHAR(20),
	Anio INT(4),
	Poblacion INT,
	Ingresos_medios FLOAT,
	Ind_latinos FLOAT,
	Ind_negros FLOAT, 
	Ind_blancos FLOAT,
	Ind_asiaticos FLOAT,
	Ind_otros FLOAT
) ENGINE = InnoDB;

INSERT INTO Areas_comunitarias(Nombre_area_com, Anio, Poblacion, Ingresos_medios, Ind_latinos, Ind_negros, Ind_blancos, Ind_asiaticos, Ind_otros) 
	VALUES 
    ('Área 1', 2020, 54991, 25000, 5.6, 10.2, 78.8, 3.8, 1.6), 
    ('Área 2', 2018, 71942, 37000, 33.6, 12.2, 8.8, 35.8, 9.6), 
	('Área 3', 2012, 56362, 15000, 25.6, 20.2, 38.8, 10.3, 5.1), 
    ('Área 4', 2022, 39493, 48000, 39.4, 23.2, 18.4, 6.8, 12.2), 
    ('Área 5', 2023, 0, 12000, 22.6, 15.2, 48.8, 6.5, 6.9);
            
-- DELITOS 
CREATE TABLE Delitos (
   Id_delito INT AUTO_INCREMENT PRIMARY KEY,
   Num_caso VARCHAR(20),
   Descripcion VARCHAR(100),
   Arrestado BOOLEAN,
   Id_area_com INT NOT NULL,
   Cuadra VARCHAR(20),
   Latitud_del FLOAT,
   Longitud_del FLOAT,
   CONSTRAINT fk_Id_area_com_delitos
		FOREIGN KEY (Id_area_com) REFERENCES Areas_comunitarias(Id_area_com)
)ENGINE = InnoDB;


INSERT INTO Delitos(Num_caso, Descripcion, Arrestado, Id_area_com , Cuadra, Latitud_del, Longitud_del) 
	VALUES 
    ('HY411648', 'Maltrato doméstico', False, 1, '043XX S WOOD ST', 41.815117, -87.670000),
    ('HY411648', 'Maltrato doméstico', False, 2, '043XX S WOOD ST', 41.815117, -87.670000),
    ('HY411595', 'Tráfico de drogas', True, 3, '035XX W BARRY AVE', 41.937406, -87.716650),
    ('HY411435', 'Robo en casa', False, 4, '082XX S LOOMIS BLVD', 41.744379,-87.658431),
    ('HY411662', 'Robo por valor menor a 500$', False, 5, '071XX S PULASKI RD', 41.763648, -87.722345) ;
    
-- HOSPITALES
CREATE TABLE Hospitales (
	Id_hospital INT AUTO_INCREMENT PRIMARY KEY,
	Nombre_hospital VARCHAR(20),
	Id_area_com INT NOT NULL,
	Direccion_hospt VARCHAR(20),
	Telefono_hospt VARCHAR(20),
	Latitud_hospt FLOAT(8,6),
	Longitud_hospt FLOAT(8,6),
	CONSTRAINT fk_Id_area_com_hospitales 
		FOREIGN KEY (Id_area_com ) REFERENCES Areas_comunitarias(Id_area_com)
)ENGINE = InnoDB;

INSERT INTO Hospitales(Nombre_hospital , Id_area_com , Direccion_hospt , Telefono_hospt , Latitud_hospt , Longitud_hospt) VALUES ('Hospital1', 1, 'Direccion 1', '1234567890', 41.815130, -87.670040);
INSERT INTO Hospitales(Nombre_hospital , Id_area_com , Direccion_hospt , Telefono_hospt , Latitud_hospt , Longitud_hospt) VALUES ('Hospital2', 2, 'Direccion 2', '1234567891', 41.605117, 87.500000);
INSERT INTO Hospitales(Nombre_hospital , Id_area_com , Direccion_hospt , Telefono_hospt , Latitud_hospt , Longitud_hospt) VALUES ('Hospital3', 3, 'Direccion 3', '1234567892', -70.815117, -80.670000);
INSERT INTO Hospitales(Nombre_hospital , Id_area_com , Direccion_hospt , Telefono_hospt , Latitud_hospt , Longitud_hospt) VALUES ('Hospital4', 4, 'Direccion 4', '1234567893', -90.815117, 01.670000);

CREATE TABLE Comisarias (
	Id_comisaria INT AUTO_INCREMENT PRIMARY KEY,
	Nombre_comisaria VARCHAR(20),
	Id_area_com INT NOT NULL,
	Direccion_com VARCHAR(20),
	Telefono_com VARCHAR(20),
	Latitud_com FLOAT,
	Longitud_com FLOAT,
	CONSTRAINT fk_Id_area_com_comisaria  
		FOREIGN KEY (Id_area_com) REFERENCES Areas_comunitarias(Id_area_com)
)ENGINE = InnoDB;


INSERT INTO Comisarias (Nombre_comisaria, Id_area_com, Direccion_com, Telefono_com, Latitud_com, Longitud_com)
	VALUES 
    ('Near_North', 1, 'Direccion 1', '98765421', 41.815117, -87.670000),
    ('Town_Hall', 2, 'Direccion 2', '98765422', 41.947400, -87.716650),
    ('Lincoln', 3, 'Direccion 3','98765423', 41.979550, -87.658431),
    ('Distrito_Morgan_Park', 4, 'Direccion 4', '98765424', 41.691435, -87.668520),
    ('Rogers_Park', 5, 'Direccion 5', '98765425',41.999763, -87.671324);

SHOW TABLE STATUS