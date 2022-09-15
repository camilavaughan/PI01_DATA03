-- Año con más carreras
SELECT year, COUNT(raceId) as races 
FROM pi.races 
GROUP BY year 
ORDER BY races DESC LIMIT 1;

-- Piloto con mayor cantidad de primeros puestos
SELECT CONCAT(drivers.forename, ' ', drivers.surname) AS name,
COUNT(results.rank) as firstPlaces
FROM pi.drivers as drivers
INNER JOIN pi.results as results
ON drivers.driverId = results.driverId
WHERE results.rank = 1
GROUP BY name
ORDER BY firstPlaces DESC LIMIT 1;

-- Nombre del circuito más corrido
SELECT name, COUNT(circuitId) as runs 
FROM pi.races 
GROUP BY name 
ORDER BY runs DESC LIMIT 1;

-- Piloto con mayor cantidad de puntos en total, cuyo constructor sea de nacionalidad sea American o British
SELECT constructors.nationality,
CONCAT(drivers.forename, ' ', drivers.surname) AS name, 
COUNT(results.points) as points 
FROM pi.constructors as constructors
INNER JOIN pi.results as results
ON constructors.constructorId = results.constructorId
INNER JOIN pi.drivers as drivers
ON results.driverId = drivers.driverId
WHERE constructors.nationality = "British" OR constructors.nationality = "American"
GROUP BY name
ORDER BY nationality LIMIT 2;