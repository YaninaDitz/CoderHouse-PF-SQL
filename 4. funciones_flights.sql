-- Creando Funciones -----------------------------------------------
-- Función para calcular la duración de un vuelo en horas:

DELIMITER //

CREATE FUNCTION fn_duracion_vuelo(fechaHoraSalida DATETIME, fechaHoraLlegada DATETIME) 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE duracion INT;
  
  SET duracion = 
    TIMESTAMPDIFF(HOUR, fechaHoraSalida, fechaHoraLlegada);

  RETURN duracion; 
END //

DELIMITER ;
SELECT idVuelo, idAvion, fn_duracion_vuelo(fechaSalida, fechaLlegada) AS duracion
FROM Vuelos;

-- Función para verificar si un tripulante está en un vuelo:
DELIMITER //
    
CREATE FUNCTION fn_tripulante_en_vuelo(pidTripulante INT, pidVuelo INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE esta BOOLEAN;
  
  SELECT COUNT(*) INTO esta
  FROM Vuelos
  WHERE idVuelo = pidVuelo
  AND idTripulante = pidTripulante;

  IF esta > 0 THEN
    RETURN 'SI';
  ELSE  
    RETURN 'NO';
  END IF;
END //

DELIMITER ;

SELECT nombre, apellido, fn_tripulante_en_vuelo(1, 102) AS Vuela
from tripulacion;