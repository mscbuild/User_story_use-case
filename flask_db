-- Create database
CREATE DATABASE flask_db;

-- Use the database
USE flask_db;

-- Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    subscribed BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create tariffs table
CREATE TABLE tariffs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    validity VARCHAR(50) NOT NULL,
    features TEXT
);
