INSERT INTO Vehicles (id, vehicle_id, registration_id, manufacturer, model, color, odometer, passanger_capacity, available) VALUES 
(1, "V1000", "2001 ABC", "Volvo", "XC90 SE", "Silver", 4350, 4, 1),
(2, "V1001", "2006 AFD", "KIA", "K7", "Black", 2195, 4, 1);

INSERT INTO Maintenances (id, m_date, m_type, m_desc, vehicle) VALUES
(1, "20120618 10:34:09 AM", "M", "Vehicle revision", (SELECT id FROM Vehicles WHERE vehicle_id="V1000"));

INSERT INTO Countries (id, country_name, lang) VALUES
(1, "France", "FR");

INSERT INTO Officials (id, first_name, last_name, official_role, prefered_lang, country) VALUES
(1, "Jean-Michel", "Dupont", "Baguette manager", "FR", (SELECT id FROM Countries WHERE country_name="France"));

INSERT INTO Drivers (id, first_name, last_name, licence_number, lang, clearance_level) VALUES
(1, "Fabien", "Martins", "ABCDEFGHIKLMNOP123", "FR", 3);

INSERT INTO Trips (id, trip_start, trip_end, official_id, driver_id, vehicle_id, start_odometer, end_odometer) VALUES
(1, "20120620 10:30:00 AM", "20120620 12:00:00 AM", (SELECT id FROM Officials WHERE id=1), (SELECT id FROM Drivers WHERE id=1), (SELECT id FROM Vehicles WHERE id=1), 4300, 4350);