CREATE TABLE nuevos_vuelos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  hora TIME, 
  usuario VARCHAR(50),
  accion VARCHAR(20),
  tabla VARCHAR(50),
  registro_afectado INT
);

delimiter //
CREATE TRIGGER trg_vuelos_audit 
before INSERT ON Vuelos
FOR EACH ROW
BEGIN
  INSERT INTO nuevos_vuelos VALUES(NULL, CURRENT_DATE(), CURRENT_TIME(), USER(), 'INSERT', 'Vuelos', NEW.idVuelo); 
END//

delimiter //
CREATE TRIGGER trg_vuelos_delete
after delete ON Vuelos
FOR EACH ROW
BEGIN
  INSERT INTO nuevos_vuelos VALUES(NULL, CURRENT_DATE(), CURRENT_TIME(), USER(), 'DELETE', 'Vuelos', OLD.idVuelo); 
END//

delimiter ;

CREATE TABLE nuevos_pasajeros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  hora TIME, 
  usuario VARCHAR(50),
  mensaje VARCHAR(100),
  nombre VARCHAR(50),
  apellido VARCHAR(50)  
);

delimiter //
CREATE TRIGGER trg_before_insert_pasajeros
BEFORE INSERT ON Pasajeros
FOR EACH ROW
BEGIN
  INSERT INTO nuevos_pasajeros VALUES(NULL, CURRENT_DATE(), CURRENT_TIME(), USER(),'Insertando pasajero:',NEW.nombre, NEW.apellido);  
END//

delimiter //
CREATE TRIGGER trg_after_delete_pasajeros
AFTER DELETE ON Pasajeros
FOR EACH ROW
BEGIN
  INSERT INTO nuevos_pasajeros VALUES(NULL, CURRENT_DATE(), CURRENT_TIME(), USER(),'Eliminando pasajero:',OLD.nombre, OLD.apellido);  
END//

delimiter ;
INSERT INTO Vuelos (idVuelo, fechaSalida, fechaLlegada, idAvion)
VALUES (106, '2023-07-01 10:00', '2023-07-01 12:00', 1);

select * from nuevos_vuelos;

INSERT INTO Pasajeros(idPasajero, nombre, apellido, idVuelo) 
VALUES (301, 'Juan', 'Ditz', 105);

select * from nuevos_pasajeros;

DELETE FROM Pasajeros WHERE idPasajero = 301;
select * from nuevos_pasajeros;

DELETE FROM Vuelos WHERE idVuelo = 106;
select * from nuevos_vuelos;