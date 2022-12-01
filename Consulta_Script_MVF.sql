--Consulta Final

-- listado de coches activos que hay en KeepCoding:
-- Nombre modelo, marca y grupo de coches (los nombre de todos)
-- Fecha de compra
-- Matricula
-- Nombre del color del coche
-- Total kilómetros
-- Nombre empresa que esta asegurado el coche
-- Numero de póliza



select c.id_coche , m.idmodelo , m.marca , m.grupo_empresarial, c.dt_compra , c.matricula , cl.nombre, c.kms_totales, ca.nombre, c.num_poliza
from schema_coches.coche c, schema_coches.modelo m, schema_coches.color cl, schema_coches.cia_aseguradora ca  
where c.idmodelo = m.idmodelo  
and c.idcolor = cl.idcolor 
and c.idcia_aseguradora = ca.idcia_aseguradora 
