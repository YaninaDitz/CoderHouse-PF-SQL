INSERT INTO Aviones VALUES  
(1, 'Airbus A320', 150),
(2, 'Boeing 737', 180), 
(3, 'Boeing 747', 400),
(4, 'Boeing 787', 300),
(5, 'Airbus A380', 550);

-- Insertar datos en tabla Tripulacion
INSERT INTO Tripulacion VALUES  
(1, 'Juan', 'Perez', 'Piloto'),
(2, 'Maria', 'Garcia', 'Copiloto'),
(3, 'Pedro', 'Suarez', 'Asistente'),
(4, 'Karla', 'Mendez', 'Piloto'),
(5, 'Esteban', 'Lopez', 'Copiloto');

-- Insertar datos en tabla Aeropuertos
INSERT INTO Aeropuertos VALUES
(1, 'Aeropuerto Intl JFK', 'Nueva York', 'Estados Unidos'),  
(2, 'Aeropuerto Intl LHR', 'Londres', 'Reino Unido'),
(3, 'Aeropuerto Intl CDG', 'Paris', 'Francia'),
(4, 'Aeropuerto Intl PEK', 'Beijing', 'China'),
(5, 'Aeropuerto Intl GRU', 'San Pablo', 'Brasil');

-- Insertar datos en tabla Vuelos
INSERT INTO Vuelos VALUES  
(101, 1, 1, '2023-03-01 10:00', '2023-03-01 14:00', 1, 2),
(102, 2, 2, '2023-03-15 12:00', '2023-03-15 17:30', 2, 3),
(103, 3, 3, '2023-04-01 09:00', '2023-04-01 11:30', 3, 1), 
(104, 4, 4, '2023-05-12 07:00', '2023-05-12 22:00', 4, 5),
(105, 5, 5, '2023-06-20 15:00', '2023-06-21 17:00', 5, 2);
INSERT INTO Vuelos VALUES  
(101, 1, 2, '2023-03-01 10:00', '2023-03-01 14:00', 1, 2),
(101, 1, 3, '2023-03-01 10:00', '2023-03-01 14:00', 1, 2),
(102, 2, 2, '2023-03-15 12:00', '2023-03-15 17:30', 2, 3),
(103, 3, 3, '2023-04-01 09:00', '2023-04-01 11:30', 3, 1), 
(104, 4, 4, '2023-05-12 07:00', '2023-05-12 22:00', 4, 5),
(105, 5, 5, '2023-06-20 15:00', '2023-06-21 17:00', 5, 2);              
-- Insertar datos en tabla Pasajeros   
INSERT INTO Pasajeros VALUES
(1, 'Alice', 'Martinez', 101),  
(2, 'Bob', 'Johnson', 101),
(3, 'Charlie', 'Garcia', 102),
(4, 'Diana', 'Flores', 103), 
(5, 'Eric', 'Diaz', 103),
(6, 'Frank', 'Perez', 104),
(7, 'Gloria', 'Rodriguez', 104),  
(8, 'Hugo', 'Gutierrez', 105),
(9, 'Isabel', 'Campos', 105);

-- Insertar datos en tabla Equipajes
INSERT INTO Equipajes (idEquipaje, idVuelo, idPasajero, peso)
VALUES 
  (1, 101, 1, 23.5),
  (2, 102, 3, 17.2),
  (3, 103, 4, 55.8),
  (4, 101, 2, 22.0),
  (5, 103, 5, 24.1),
  (6, 104, 6, 29.0),
  (7, 104, 7, 22.5),
  (8, 105, 8, 20.3),
  (9, 105, 9, 21.0);

-- Insertar datos en tabla Asientos
INSERT INTO Asientos VALUES
  (1, 101, '1A', 'Primera'),
  (2, 101, '1B', 'Primera'),
  (3, 102, '14C', 'Turista'),
  (4, 103, '18J', 'Ejecutiva'),  
  (5, 103, '22A', 'Turista'),
  (6, 104, '38B', 'Primera'),
  (7, 105, '5C', 'Turista');

-- Insertar datos en tabla Reservas
INSERT INTO Reservas VALUES
  (1, 101, 1, '2023-01-29'), 
  (2, 102, 3,'2023-01-30'),
  (3, 103, 4, '2023-02-01'),
  (4, 103, 5, '2023-01-28'), 
  (5, 104, 6, '2023-02-02'),
  (6, 105, 8, '2023-02-05'),
  (11, 101, 1, '2023-01-29'),
  (22, 102, 5, '2023-02-14'),    
  (33, 105, 9, '2023-02-20'),
  (44, 104, 6, '2023-03-01'),
  (55, 103, 8, '2023-03-05'),
  (66, 105, 7, '2023-03-15');
    
-- Insertar datos en tabla Pagos
INSERT INTO Pagos VALUES  
  (1, 1, 125.50, 'Tarjeta de credito', '2023-02-10'),
  (2, 2, 155.80, 'PayPal', '2023-02-11'),
  (3, 3, 83.90, 'Transferencia bancaria', '2023-02-15'),
  (101, 11, 223.5, 'Efectivo', '2023-01-29'),
  (202, 22, 127.5, 'Transferencia', '2023-02-18'),
  (303, 33, 95.6, 'Tarjeta', '2023-02-25'),  
  (404, 44, 354.1, 'PayPal', '2023-03-01'),
  (505, 55, 194.8, 'Cripto', '2023-03-07'),
  (606, null, 453.2, 'Tarjeta', '2023-03-16');
  

