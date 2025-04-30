-- Create Database

CREATE DATABASE house_mate_app_db;

-- End of Create Database

-- User Infomation

CREATE TABLE user_info(
    user_id SERIAL PRIMARY KEY,
    house_id INT REFERENCES house_info(house_id) NOT NULL,
    user_name VARCHAR(15) NOT NULL UNIQUE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    username VARCHAR(30)NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- End of User Information

-- Chore Information

CREATE TABLE chores(
    chore_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES user_info(user_id) NOT NULL,
    chore_name VARCHAR(20) NOT NULL,
    chore_description VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL,
    assigned_date DATE NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE
);

-- End of Chore Information

-- House Information

CREATE TABLE house_info(
    house_id SERIAL PRIMARY KEY,
    house_nickname VARCHAR(15) NOT NULL,
    house_address VARCHAR(50) NOT NULL UNIQUE,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    postcode char(10)
);

-- End of House Information

-- Message Information

CREATE TABLE messages(
    message_id SERIAL PRIMARY KEY,
    house_id INT REFERENCES house_info(house_id) NOT NULL,
    user_id INT REFERENCES user_info(user_id) NOT NULL,
    message_text TEXT NOT NULL,
    message_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- End of Message Information

-- Shopping List

CREATE TABLE shopping_list(
    item_id SERIAL PRIMARY KEY,
    house_id INT REFERENCES house_info(house_id) NOT NULL,
    item_name VARCHAR(20) NOT NULL,
    item_quantity INT NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,
    item_bought BOOLEAN NOT NULL DEFAULT FALSE
    user_id INT REFERENCES user_info(user_id) NOT NULL,
);

-- End of Shopping List