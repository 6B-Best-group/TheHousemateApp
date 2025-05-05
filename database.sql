-- Create Database
CREATE DATABASE house_mate_app_db;

-- End of Create Database
-- house Information
CREATE TABLE
    house_info (
        house_id SERIAL PRIMARY KEY,
        house_nickname VARCHAR(15) NOT NULL,
        house_address VARCHAR(50) NOT NULL UNIQUE,
        city VARCHAR(50) NOT NULL,
        country VARCHAR(50) NOT NULL,
        postcode CHAR(10) NOT NULL,
        bin_code VARCHAR(30) NOT NULL
    );

-- User Information
CREATE TABLE
    user_info (
        user_id SERIAL PRIMARY KEY,
        house_id INT REFERENCES house_info (house_id) NOT NULL,
        user_name VARCHAR(15) NOT NULL UNIQUE,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        username VARCHAR(30) NOT NULL UNIQUE,
        password VARCHAR(50) NOT NULL,
        email VARCHAR(50) NOT NULL,
        date_of_birth DATE NOT NULL
    );

-- Chore Information
CREATE TABLE
    chores (
        chore_id SERIAL PRIMARY KEY,
        user_id INT REFERENCES user_info (user_id) NOT NULL,
        chore_name VARCHAR(20) NOT NULL,
        chore_description VARCHAR(50) NOT NULL,
        due_date DATE NOT NULL,
        assigned_date DATE NOT NULL,
        completed BOOLEAN NOT NULL DEFAULT FALSE
    );

-- Message Information
CREATE TABLE
    messages (
        message_id SERIAL PRIMARY KEY,
        house_id INT REFERENCES house_info (house_id) NOT NULL,
        user_id INT REFERENCES user_info (user_id) NOT NULL,
        message_text TEXT NOT NULL,
        message_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Shopping List
CREATE TABLE
    shopping_list (
        item_id SERIAL PRIMARY KEY,
        house_id INT REFERENCES house_info (house_id) NOT NULL,
        item_name VARCHAR(20) NOT NULL,
        item_quantity INT NOT NULL,
        item_price DECIMAL(10, 2) NOT NULL,
        item_bought BOOLEAN NOT NULL DEFAULT FALSE,
        user_id INT REFERENCES user_info (user_id) NOT NULL
    );

-- Queries
-- Add new user 
INSERT INTO
    user_info (
        house_id,
        user_name,
        first_name,
        last_name,
        username,
        password,
        email,
        date_of_birth
    )
VALUES
    (?, ?, ?, ?, ?, ?, ?, ?);

-- Update user info
UPDATE user_info
SET
    user_name = ?,
    first_name = ?,
    last_name = ?,
    username = ?,
    password = ?,
    email = ?,
    date_of_birth = ?
WHERE
    user_id = ?;

-- Delete user
DELETE FROM user_info
WHERE
    user_id = ?;

-- get user info
SELECT
    *
FROM
    user_info
WHERE
    user_id = ?;

-- get chores 
SELECT
    *
FROM
    chores
WHERE
    user_id = ?;

-- set chores
INSERT INTO
    chores (
        user_id,
        chore_name,
        chore_description,
        due_date,
        assigned_date,
        completed
    )
VALUES
    (?, ?, ?, ?, ?, ?);

-- Completed chore 
UPDATE chores
SET
    completed = TRUE
WHERE
    chore_id = ?;

--Remove Chore
DELETE FROM chores
WHERE
    chore_id = ?;

-- get house info
SELECT
    *
FROM
    house_info
WHERE
    house_id = ?;

-- set house info
INSERT INTO
    house_info (
        house_nickname,
        house_address,
        city,
        country,
        postcode,
        bin_code
    )
VALUES
    (?, ?, ?, ?, ?, ?);

-- get messages
SELECT
    *
FROM
    messages
WHERE
    house_id = ?;

-- send messages
INSERT INTO
    messages (house_id, user_id, message_text, message_date)
VALUES
    (?, ?, ?, CURRENT_TIMESTAMP);

-- get shopping list   
SELECT
    *
FROM
    shopping_list
WHERE
    house_id = ?;

-- Item brought (Price is per item)
UPDATE shopping_list
SET
    item_bought = TRUE,
    item_quantity = item_quantity - 1,
    item_price = item_price * ?             
WHERE
    item_id = ?;

-- add item to shopping list
INSERT INTO
    shopping_list (
        house_id,
        item_name,
        item_quantity,
        item_price,
        item_bought,
        user_id
    )
VALUES
    (?, ?, ?, ?, ?, ?);

-- Security, Testing

-- Createing rolls for users 
