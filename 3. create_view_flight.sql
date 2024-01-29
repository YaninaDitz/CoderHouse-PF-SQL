-- Vista de vuelos con origen Estados Unidos
CREATE VIEW vw_vuelos_usa AS
SELECT v.idVuelo, v.fechaSalida, v.fechaLlegada, a.nombre AS aeropuertoSalida 
FROM Vuelos v
INNER JOIN Aeropuertos a ON a.idAeropuerto = v.idAeropuertoSalida
WHERE a.pais = 'Estados Unidos';

-- Vista vuelos por pasajeros
CREATE VIEW vw_pasajeros_por_vuelo AS
SELECT v.idVuelo, v.fechaSalida, COUNT(p.idPasajero) AS pasajeros  
FROM Vuelos v
LEFT JOIN Pasajeros p ON p.idVuelo = v.idVuelo
GROUP BY v.idVuelo;

-- Vista de tripulación con puesto de piloto
CREATE VIEW vw_pilotos AS
SELECT * 
FROM Tripulacion
WHERE puesto = 'Piloto';

-- Vista de vuelos por modelo de avión
CREATE VIEW vw_vuelos_por_avion AS
SELECT a.modelo, COUNT(v.idVuelo) AS cantidad
FROM Vuelos v
INNER JOIN Aviones a ON a.idAvion = v.idAvion
GROUP BY a.modelo;

-- Vista de aeropuertos de Latinoamerica
CREATE VIEW vw_aeropuertos_latam AS 
SELECT *
FROM Aeropuertos
WHERE pais IN ('Argentina', 'Brasil', 'Chile', 'Colombia', 'México', 'Perú');

