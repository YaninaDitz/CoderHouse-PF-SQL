-- Peso total del equipaje por vuelo
SELECT V.idVuelo, SUM(E.peso) AS peso_total
FROM Equipajes E 
INNER JOIN Vuelos V 
  ON E.idVuelo = V.idVuelo
GROUP BY V.idVuelo;

-- Cantidad de asientos reservados por clase de servicio y vuelo
SELECT V.idVuelo, A.clase, COUNT(A.idAsiento) AS asientos_reservados
FROM Asientos A
INNER JOIN Vuelos V
  ON A.idVuelo = V.idVuelo
GROUP BY V.idVuelo, A.clase;

-- Listado de pasajeros y pagos realizados
SELECT P.nombre, P.apellido, R.idReserva, R.fechaReserva, R.idVuelo, 
P2.monto, P2.medioPago  
FROM Pasajeros P
INNER JOIN Reservas R
  ON P.idPasajero = R.idPasajero
INNER JOIN Pagos P2
  ON R.idReserva = P2.idReserva;
  
-- Total de ingresos por pasajeros frecuentes  
SELECT P.nombre, P.apellido, SUM(PA.monto) AS total_pagado  
FROM Pasajeros P 
INNER JOIN Reservas R 
  ON P.idPasajero = R.idPasajero
INNER JOIN Pagos PA  
  ON R.idReserva = PA.idReserva
GROUP BY P.idPasajero
ORDER BY total_pagado DESC;

-- Peso promedio de equipaje despachado por aeropuerto
SELECT A.nombre AS aeropuerto, AVG(E.peso) AS promedio
FROM Aeropuertos A
INNER JOIN Vuelos V
  ON A.idAeropuerto = V.idAeropuertoSalida  
INNER JOIN Equipajes E
  ON V.idVuelo = E.idVuelo
GROUP BY A.nombre;
