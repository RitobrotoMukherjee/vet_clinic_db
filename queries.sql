/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = 't';
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Part -02 */
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts), neutered  FROM animals GROUP BY neutered;
SELECT MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* JOIN queries one to many ralationship */
SELECT a.id AS animal_id, a.name AS animal_name, b.full_name AS owner_name FROM animals a
JOIN owners b ON a.owner_id = b.id
WHERE b.full_name = 'Melody Pond'; 

SELECT a.id AS animal_id, a.name AS animal_name, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg,
b.name AS species_name FROM animals a
JOIN species b ON a.species_id = b.id
WHERE b.name = 'Pokemon'; 

SELECT a.full_name AS "Owner", b.name AS "Animal" FROM owners a 
LEFT JOIN animals b ON a.id = b.owner_id;

SELECT COUNT(*) AS "Animal Count", b.name FROM animals a 
JOIN species b ON a.species_id = b.id
GROUP BY a.species_id, b.name;

SELECT a.name AS "Animal", b.name AS "Species", c.full_name AS "Owner" FROM animals a
JOIN species b ON a.species_id = b.id
JOIN owners c ON a.owner_id = c.id
WHERE b.name = 'Digimon' AND c.full_name = 'Jennifer Orwell';

SELECT a.name AS "Animals", a.escape_attempts AS "Tried To Escape", b.full_name AS "Owner" FROM animals a
JOIN owners b ON a.owner_id = b.id 
WHERE b.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT a.full_name AS "Owner Name", COUNT(b.*) AS "Animal Count" FROM owners a
LEFT JOIN animals b ON a.id = b.owner_id
GROUP BY a.full_name;