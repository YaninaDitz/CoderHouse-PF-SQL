-- -----------------------------------------------------
-- Creación de la BASE.
-- -----------------------------------------------------
CREATE DATABASE Flights;
USE Flights;

-- -----------------------------------------------------
-- Creación de las TABLAS.
-- -----------------------------------------------------
-- Tabla Aviones----------------------------------------
CREATE TABLE Aviones (
  idAvion INT PRIMARY KEY,
  modelo VARCHAR(50),
  capacidad INT
);

-- Tabla Tripulacion----------------------------------------
CREATE TABLE Tripulacion (
  idTripulante INT PRIMARY KEY, 
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  puesto VARCHAR(50)
);

-- Tabla Aeropuertos----------------------------------------
CREATE TABLE Aeropuertos (
  idAeropuerto INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(50),
  pais VARCHAR(50)
);

-- Tabla Vuelos----------------------------------------
CREATE TABLE Vuelos (
  idVuelo INT PRIMARY KEY,
  idAvion INT,
  idTripulante INT,
  fechaSalida DATETIME,
  fechaLlegada DATETIME,
  idAeropuertoSalida INT,
  idAeropuertoLlegada INT,
  FOREIGN KEY (idAvion) REFERENCES Aviones(idAvion),
  FOREIGN KEY (idTripulante) REFERENCES Tripulacion(idTripulante),
  FOREIGN KEY (idAeropuertoSalida) REFERENCES Aeropuertos(idAeropuerto),
  FOREIGN KEY (idAeropuertoLlegada) REFERENCES Aeropuertos(idAeropuerto)
);

CREATE INDEX idx_fecha ON Vuelos(fechaSalida, fechaLlegada);

-- Tabla Pasajeros----------------------------------------
CREATE TABLE Pasajeros (
  idPasajero INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50), 
  idVuelo INT,
  FOREIGN KEY (idVuelo) REFERENCES Vuelos(idVuelo)
);

-- Tabla Equipajes------------------------------------------
CREATE TABLE Equipajes (
  idEquipaje INT PRIMARY KEY,
  idVuelo INT,
  idPasajero INT,
  peso FLOAT,
  FOREIGN KEY (idVuelo) REFERENCES Vuelos(idVuelo),
  FOREIGN KEY (idPasajero) REFERENCES Pasajeros(idPasajero)
);

-- Tabla Asientos-------------------------------------------
CREATE TABLE Asientos(
  idAsiento INT PRIMARY KEY, 
  idVuelo INT,
  numeroAsiento VARCHAR(5),
  clase VARCHAR(20),
  FOREIGN KEY (idVuelo) REFERENCES Vuelos(idVuelo)  
);

-- Tabla Reservas--------------------------------------------
CREATE TABLE Reservas(
  idReserva INT PRIMARY KEY, 
  idVuelo INT, 
  idPasajero INT,
  fechaReserva DATETIME,
  FOREIGN KEY (idVuelo) REFERENCES Vuelos(idVuelo),
  FOREIGN KEY (idPasajero) REFERENCES Pasajeros(idPasajero)
);

-- Tabla Pagos----------------------------------------------
CREATE TABLE Pagos(
  idPago INT PRIMARY KEY, 
  idReserva INT,
  monto DECIMAL(10,2),
  medioPago VARCHAR(50),
  fecha DATE,
  FOREIGN KEY (idReserva) REFERENCES Reservas(idReserva)
);
