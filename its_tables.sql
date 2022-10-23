CREATE TABLE Vehicles (
    id int NOT NULL,
    vehicle_id varchar(32),
    registration_id varchar(32),
    manufacturer varchar(32),
    model varchar(32),
    color varchar(32),
    odometer int,
    passanger_capacity int,
    available bit,
    PRIMARY KEY (id)
);

CREATE TABLE Maintenances (
    id int NOT NULL,
    m_date DATETIME,
    m_type char(1),
    m_desc varchar(128),
    vehicle int,
    FOREIGN KEY (vehicle) REFERENCES Vehicles(id),
    PRIMARY KEY (id)
);

CREATE TABLE Countries (
    id int NOT NULL,
    country_name varchar(32),
    lang char(2),
    PRIMARY KEY (id)
);

CREATE TABLE Officials (
    id int NOT NULL,
    first_name varchar(32),
    last_name varchar(32),
    official_role varchar(32),
    prefered_lang char(2),
    country int,
    FOREIGN KEY (country) REFERENCES Countries(id),
    PRIMARY KEY (id)
);

CREATE TABLE Drivers (
    id int NOT NULL,
    first_name varchar(32),
    last_name varchar(32),
    licence_number char(18),
    lang char(2),
    clearance_level int CHECK (clearance_level BETWEEN 1 AND 4),
    PRIMARY KEY (id)
);

CREATE TABLE Trips (
    id int NOT NULL,
    trip_start DATETIME,
    trip_end DATETIME,
    official_id int,
    driver_id int,
    vehicle_id int,
    start_odometer int,
    end_odometer int,
    FOREIGN KEY (official_id) REFERENCES Officials(id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(id),
    PRIMARY KEY (id)
);