-- HOSPITALES
CREATE TABLE Hospitales(
	Id_hospital INT AUTO_INCREMENT PRIMARY KEY,
	Nombre_hospital VARCHAR(20) NOT NULL,
	Id_area_com INT,
	Direccion_hospt VARCHAR(20) NOT NULL,
	Telefono_hospt VARCHAR(20) NOT NULL,
	Latitud_hospt FLOAT(8,6 ) NOT NULL,
	Longitud_hospt FLOAT(8,6) NOT NULL,
 	CONSTRAINT fk_Id_area_com FOREIGN KEY (Id_area_com )
     		REFERENCES Areas_comunitarias(Id_area_com)
);

INSERT INTO Hospitales VALUES (1, 'Hospital1', 1, 'Direccion 1', '1234567890', 41.815130, -87.670040),
							  (2, 'Hospital2', 2, 'Direccion 2', '1234567891', 41.605117, 87.500000),
                              (3, 'Hospital3', 3, 'Direccion 3', '1234567892', -70.815117, -80.670000),
                              (4, 'Hospital4', 4, 'Direccion 4', '1234567893', -90.815117, 01.670000);

SELECT * FROM hospitales;

-- AREAS COMUNITARIAS 
CREATE TABLE Areas_comunitarias ( 
	Id_area_com INTEGER AUTO_INCREMENT PRIMARY KEY, 
	Nombre_area_com VARCHAR(20), 
	Anio INTEGER(4), 
	Poblacion INTEGER, 
	Ingresos_medios FLOAT, 
	Ind_latinos FLOAT, 
	Ind_negros FLOAT,  
	Ind_blancos FLOAT, 
	Ind_asiaticos FLOAT, 
	Ind_otros FLOAT
); 

INSERT INTO Areas_comunitarias VALUES (1, 'Área 1', 2020, 54991, 25000, 5.6, 10.2, 78.8, 3.8, 1.6),
									  (2, 'Área 2', 2018, 71942, 37000, 33.6, 12.2, 8.8, 35.8, 9.6),
                                      (3, 'Área 3', 2012, 56362, 15000, 25.6, 20.2, 38.8, 10.3, 5.1),
                                      (4, 'Área 4', 2022, 39493, 48000, 39.4, 23.2, 18.4, 6.8, 12.2),
                                      (5, 'Área 5', 2023, 0, 12000, 22.6, 15.2, 48.8, 6.5, 6.9);

-- DELITOS
CREATE TABLE Delitos ( 
	Id_delito INTEGER AUTO_INCREMENT PRIMARY KEY, 
	Num_caso VARCHAR(20),
    Id_area_com INT,
	Descripcion VARCHAR(20), 
	Arrestado BOOLEAN, 
	Cuadra VARCHAR(20), 
	Latitud FLOAT, 
	Longitud FLOAT,
    CONSTRAINT fk_Id_area_com  FOREIGN KEY (Id_area_com)
		REFERENCES Areas_comunitarias(Id_area_com)
); 

INSERT INTO Delitos(Num_caso, Descripcion, Arrestado, Id_area_com, Cuadra, Latitud, Longitud) VALUES ('HY411648', 'Maltrato doméstico', False, 2, '043XX S WOOD ST', 41.815117, -87.670000),
																									 ('HY411595', 'Tráfico de drogas', True, 21, '035XX W BARRY AVE', 41.937406, -87.716650),
                                                                                                     ('HY411435', 'Robo en casa', False, 71, '082XX S LOOMIS BLVD', 41.744379,-87.658431),
                                                                                                     ('HY411662', 'Robo por valor menor a 500$', False, 65, '071XX S PULASKI RD', 41.763648, -87.722345) ; 

SELECT * FROM delitos;

-- COMISARIAS
