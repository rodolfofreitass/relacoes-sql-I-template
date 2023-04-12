-- Active: 1681329535676@@127.0.0.1@3306


-- Práticas

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO users (id, name, email, password)
VALUES
("01", "Bruno", "bruno@email.com", "123456789"),
("02", "Rodolfo", "rodolfo@email.com", "123456789");

SELECT * FROM users;

INSERT INTO phones (id, phone_number, user_id)
VALUES
("p01","61983408711","02"),
("p02","61983408777","02"),
("p03","61983408788","01");

SELECT * FROM phones;

-- JUNTANDO AS DUAS INFORMAÇÕES
SELECT * FROM users
INNER JOIN phones
ON users.id = phones.user_id;

-- IRÁ DEVOLVER OS ID USERS Q SAO IGUAIS AOS PHONES USERID
SELECT * FROM users
INNER JOIN phones
ON users.id = phones.user_id;

-- USANDO AS PARA FAZER BUSCA
SELECT u.id, u.name, u.email, u.password, p.phone_number
FROM users AS u
INNER JOIN phones AS p
ON u.id = p.user_id;

-- PRÁTICA 3

CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL, 
    register_number TEXT UNIQUE NOT NULL, 
    category TEXT NOT NULL
);

CREATE TABLE drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL, 
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses(id, register_number, category)
VALUES
("001","2023","A"),
("002","2024","AB");

SELECT * FROM licenses;

SELECT * FROM drivers;

INSERT INTO drivers(id, name, email, password, license_id)
VALUES
("d001","Carlos","carlos@email.com","12345","001"),
("d002","João","joão@email.com","54321","002");

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;