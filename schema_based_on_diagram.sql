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
 PRIMARY KEY(id),
 FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE table invoice_items(
 id INT GENERATED ALWAYS AS IDENTITY,
 unit_price DECIMAL NOT NULL,
 quantity INT NOT NULL,
 total_price DECIMAL NOT NULL,
 invoice_id INT NOT NULL,
 treatment_id INT NOT NULL,
 PRIMARY KEY(id),
 FOREIGN KEY(invoice_id) REFERENCES invoices(id),
 FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

/* JOIN TABLES */

/* INVOICES - MEDICAL_HISTORIES - PATIENTS */
SELECT patients.name as PatientName, medical_histories.admitted_at as Admited, invoices.payed_at as Payed
FROM invoices
JOIN medical_histories ON invoices.medical_history_id = medical_histories.id
JOIN patients ON medical_histories.patient_id = patients.id;

/* TREATMENTS - INVOICES - INVOICE_ITEMS */
SELECT treatments.name as treatment, invoice_items.quantity, invoices.total_amount
FROM invoice_items
JOIN treatments ON invoice_items.treatment_id = treatments.id
JOIN invoices ON invoice_items.invoice_id = invoices.id;