/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY, 
    name VARCHAR, date_of_birth DATE NOT NULL, 
    escape_attempts NUMERIC, 
    neutered BOOLEAN, 
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR; 

CREATE TABLE owners (
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR,
    age NUMERIC
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY, 
    name VARCHAR
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id); 

ALTER TABLE animals 
ADD COLUMN owner_id INTEGER,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);




