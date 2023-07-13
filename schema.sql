/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY, 
    name VARCHAR, date_of_birth DATE NOT NULL, 
    escape_attempts NUMERIC, 
    neutered BOOLEAN, 
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR; 

