CREATE TABLE patients(
id int PRIMARY KEY IDENTITY (1,1),
name varchar,
date_of_birth date,
)

CREATE TABLE medical_histories(
id int PRIMARY KEY IDENTITY (1,1),
admitted_at timestamp,
patient_id int,
FOREIGN KEY (patient_id) REFERENCES patients(id),
status varchar
)
CREATE INDEX patient_id_medical_histories_index
    ON medical_histories (patient_id)

CREATE TABLE invoices(
id int PRIMARY KEY IDENTITY (1,1),
total_amount decimal,
generated_at datetime,
payed_at timestamp,
medical_history_id int,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
)
CREATE INDEX medical_id_invoices_index
    ON invoices (medical_history_id)

CREATE TABLE treatments(
id int PRIMARY KEY IDENTITY (1,1),
type varchar,
name varchar
)

CREATE TABLE join_treatments_medical_histories (
id int PRIMARY KEY IDENTITY (1,1),
treatment_id int,
medical_hisotry_id int,
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
FOREIGN KEY (medical_hisotry_id) REFERENCES medical_histories(id),
)
CREATE INDEX treatment_id_join_index
    ON join_treatments_medical_histories (treatment_id)
CREATE INDEX medical_id_join_index
    ON join_treatments_medical_histories (medical_hisotry_id)

CREATE TABLE invoice_items (
id int PRIMARY KEY IDENTITY (1,1),
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int,
treatment_id int,
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
FOREIGN KEY (invoice_id) REFERENCES invoices(id),
)
CREATE INDEX treatment_id_invoice_items_index
    ON invoice_items (treatment_id)
CREATE INDEX invoice_id_join_index
    ON invoice_items (invoice_id)