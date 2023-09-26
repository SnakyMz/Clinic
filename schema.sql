CREATE database clinic;

CREATE table patients(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
PRIMARY KEY(id)
);