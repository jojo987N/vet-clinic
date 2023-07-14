/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Agumon', '2020-02-03', 10.23, 0, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Gabumon', '2018-11-15', 8, 2, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Pikachu', '2021-01-07', 15.04, 1, false);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Devimon', '2017-12-05', 11, 5, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Charmander', '2020-02-08', -11, 0, false);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Plantmon', '2021-11-15', -5.7, 2, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Squirtle', '1993-04-02', -12.13, 3, false);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Angemon', '2005-06-12', -45, 1, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Boarmon', '2005-06-07', 20.4, 7, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Blossom', '1998-10-13', 17, 3, true);

INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Ditto', '2022-05-14', 22, 4, true);


INSERT INTO owners (full_name, age) VALUES ('Smith', 34);

INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age) VALUES ('Bob', 45);

INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = s.id FROM species AS s WHERE animals.name LIKE '%mon' and s.name = 'Digimon';

UPDATE animals SET species_id = s.id FROM species AS s WHERE animals.name NOT LIKE '%mon' and s.name = 'Pokemon';

Begin;
UPDATE animals SET owner_id = o.id FROM owners AS o WHERE animals.name = 'Agumon' and o.full_name = 'Sam Smith';
savepoint sp1;

UPDATE animals SET owner_id = o.id FROM owners AS o WHERE (animals.name = 'Gabumon' or animals.name = 'Pikachu') and o.full_name = 'Jennifer Orwell';

UPDATE animals SET owner_id = o.id FROM owners AS o WHERE (animals.name = 'Devimon' or animals.name = 'Plantmon') and o.full_name = 'Bob';

UPDATE animals SET owner_id = o.id FROM owners AS o WHERE (animals.name = 'Charmander' or animals.name = 'Squirtle' or animals.name = 'Blossom') and o.full_name = 'Melody Pond';

UPDATE animals SET owner_id = o.id FROM owners AS o WHERE (animals.name = 'Angemon' or animals.name = 'Boarmon') and o.full_name = 'Dean Winchester';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id)
SELECT id from species WHERE name = 'Pokemon';


INSERT INTO
  specializations (species_id, vets_id)
SELECT
  s.id, v.id
FROM
  (SELECT id from species WHERE name = 'Pokemon') AS s
CROSS JOIN
  (SELECT id from vets WHERE name = 'William Tatcher') AS v;

INSERT INTO
  specializations (species_id, vets_id)
SELECT
  s.id, v.id
FROM
  (SELECT id from species WHERE name = 'Digimon' or name = 'Pokemon') AS s
CROSS JOIN
  (SELECT id from vets WHERE name = 'Stephanie Mendez') AS v;

Begin;
INSERT INTO
  specializations (species_id, vets_id)
SELECT
  s.id, v.id
FROM
  (SELECT id from species WHERE name = 'Digimon') AS s
CROSS JOIN
  (SELECT id from vets WHERE name = 'Jack Harkness') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-05-24'
FROM
  (SELECT id from animals WHERE name = 'Agumon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'William Tatcher') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-07-22'
FROM
  (SELECT id from animals WHERE name = 'Agumon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Stephanie Mendez') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2021-02-02'
FROM
  (SELECT id from animals WHERE name = 'Gabumon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Jack Harkness') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-01-05'
FROM
  (SELECT id from animals WHERE name = 'Pikachu') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-03-08'
FROM
  (SELECT id from animals WHERE name = 'Pikachu') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-05-14'
FROM
  (SELECT id from animals WHERE name = 'Pikachu') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2021-05-04'
FROM
  (SELECT id from animals WHERE name = 'Devimon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Stephanie Mendez') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2021-02-24'
FROM
  (SELECT id from animals WHERE name = 'Charmander') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Jack Harkness') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2019-12-21'
FROM
  (SELECT id from animals WHERE name = 'Plantmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-08-10'
FROM
  (SELECT id from animals WHERE name = 'Plantmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'William Tatcher') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2021-04-07'
FROM
  (SELECT id from animals WHERE name = 'Plantmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2019-09-29'
FROM
  (SELECT id from animals WHERE name = 'Squirtle') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Stephanie Mendez') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-10-03'
FROM
  (SELECT id from animals WHERE name = 'Angemon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Jack Harkness') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-11-04'
FROM
  (SELECT id from animals WHERE name = 'Angemon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Jack Harkness') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2019-01-24'
FROM
  (SELECT id from animals WHERE name = 'Boarmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2019-05-15'
FROM
  (SELECT id from animals WHERE name = 'Boarmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-02-27'
FROM
  (SELECT id from animals WHERE name = 'Boarmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-08-03'
FROM
  (SELECT id from animals WHERE name = 'Boarmon') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Maisy Smith') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2020-05-24'
FROM
  (SELECT id from animals WHERE name = 'Blossom') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'Stephanie Mendez') AS v;

Begin;
INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
SELECT
  a.id, v.id, '2021-01-11'
FROM
  (SELECT id from animals WHERE name = 'Blossom') AS a
CROSS JOIN
  (SELECT id from vets WHERE name = 'William Tatcher') AS v;











