-- SP1----------------------------------------------
DELIMITER //

CREATE PROCEDURE sp_ordenar_tabla(
  IN nombreTabla VARCHAR(50),
  IN nombreCampoOrden VARCHAR(50),
  IN esDescendente BOOLEAN  
)
BEGIN

  DECLARE consulta VARCHAR(200);

  SET consulta = CONCAT('SELECT * FROM ', nombreTabla, ' ORDER BY ', nombreCampoOrden);
  
  IF esDescendente THEN
    SET consulta = CONCAT(consulta, ' DESC');
  ELSE
    SET consulta = CONCAT(consulta, ' ASC');
  END IF;

  SET @sql = consulta; 
  PREPARE stmt FROM @sql;
  EXECUTE stmt;

END //

DELIMITER ;

CALL sp_ordenar_tabla('Vuelos','fechaSalida', false); -- Ascendente
CALL sp_ordenar_tabla('Pasajeros','idPasajero', true); -- Descentente


-- SP2 ---------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE sp_eliminar_registro(
  IN tabla VARCHAR(50),
  IN nombre_columna_primaria VARCHAR(50), 
  IN valor_columna_primaria INT  
)
BEGIN

  SET @sql = CONCAT('DELETE FROM ', tabla, ' WHERE ', nombre_columna_primaria, ' = ', valor_columna_primaria);  

  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;

END //

DELIMITER ;

CALL sp_eliminar_registro('pasajeros', 'idPasajero', 5);