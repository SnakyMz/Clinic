CREATE database clinic;

CREATE table patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

CREATE table medical_histories(
 id INT GENERATED ALWAYS AS IDENTITY,
 admitted_at TIMESTAMP NOT NULL,
 patient_id INT NOT NULL,
 status VARCHAR(100) NOT NULL,
 FOREIGN KEY(patient_id) REFERENCES patients(id)
);