/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * from animals WHERE name LIKE '%mon'; 

SELECT name from animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2019-01-01';

SELECT name from animals WHERE neutered = true and escape_attempts < 3;

SELECT date_of_birth from animals WHERE name = 'Agumon' or  name = 'Pikachu';

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name <> 'Gabumon';

SELECT * from animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

Begin;
UPDATE animals SET species = 'unspecified';
SELECT species from animals; 
ROLLBACK;
SELECT species from animals; 

Begin;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT species from animals;

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species from animals;
commit;

Begin;
DELETE FROM animals; 
ROLLBACK;


Begin;
DELETE FROM animals WHERE date_of_birth > '2022-01-01'; 
savepoint sp1;

UPDATE animals SET weight_kg = -1*weight_kg 
Rollback to sp1;

UPDATE animals SET weight_kg = -1*weight_kg WHERE weight_kg < 0
commit;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) as sum_escape FROM animals GROUP BY neutered ORDER BY sum_escape DESC;

SELECT neutered, MIN(weight_kg) as min, MAX(weight_kg) as max FROM animals GROUP BY neutered;

SELECT neutered, AVG(escape_attempts) FROM animals where date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY neutered;

SELECT name, owners.full_name as owner from animals INNER JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name = 'Melody Pond' ;

SELECT animals.name, species.name as specy from animals INNER JOIN species ON animals.species_id=species.id WHERE species.name = 'Pokemon' ;

SELECT name as animal, owners.full_name as owners from animals RIGHT JOIN owners ON animals.owner_id=owners.id;

SELECT COUNT(*) as count, species.name as specy from animals INNER JOIN species ON animals.species_id=species.id GROUP BY species.name;

SELECT species.name as species,animals.name as animal, owners.full_name as owner from animals JOIN owners ON animals.owner_id=owners.id JOIN species ON animals.species_id=species.id WHERE owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';

SELECT * from animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name = 'Dean Winchester' and escape_attempts = 0;

SELECT owners.full_name, COUNT(*) as count from animals JOIN owners ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;


SELECT animals.name as "last animal", vets.name as vet, visits.date_of_visit from visits JOIN animals ON animals.id=visits.animals_id JOIN vets ON vets.id=visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT ( DISTINCT visits.animals_id ) from visits JOIN vets ON vets.id=visits.vets_id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name as "vet name", species.name as specialities from specializations RIGHT JOIN vets ON vets.id=specializations.vets_id LEFT JOIN species ON species.id=specializations.species_id;

SELECT animals.name as "animal name", vets.name as "vet name", visits.date_of_visit from visits JOIN animals ON animals.id=visits.animals_id JOIN vets ON vets.id=visits.vets_id WHERE vets.name = 'Stephanie Mendez' and visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT COUNT(*) as "nb visits", animals.name as "animal name" from visits JOIN animals ON animals.id=visits.animals_id GROUP BY animals.name ORDER BY "nb visits" DESC LIMIT 1;

SELECT vets.name as "vet name", animals.name as "animal name", visits.date_of_visit from visits JOIN animals ON animals.id=visits.animals_id JOIN vets ON vets.id=visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*) from visits LEFT JOIN specializations ON visits.vets_id = specializations.vets_id JOIN animals ON visits.animals_id = animals.id WHERE animals.species_id <> specializations.species_id;

SELECT COUNT(*) as count, species.name as species from visits JOIN vets ON vets.id=visits.vets_id JOIN animals ON visits.animals_id = animals.id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;


