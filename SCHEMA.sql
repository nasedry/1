-- Це файл SCHEMA.sql. Він створює саму базу даних, таблиці, індекси,
-- зовнішні ключі (FOREIGN KEY), тригери та представлення (Views).
-- Вміст взятий із мого файлу tourism_db_2_2_schema.sql.

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Створюю базу
DROP DATABASE IF EXISTS tourism_db;
CREATE DATABASE tourism_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;
USE tourism_db;

-- Приклад створення однієї з таблиць (Route)
CREATE TABLE route (
  id_route      INT AUTO_INCREMENT PRIMARY KEY,
  name          VARCHAR(150) NOT NULL,
  region        VARCHAR(120),
  difficulty    ENUM('easy','medium','hard') NOT NULL DEFAULT 'easy',
  length_km     DECIMAL(6,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB;

-- Приклад створення таблиці Booking з ключами до Tour та Client
CREATE TABLE booking (
    id_booking INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    tour_id INT NOT NULL,
    tour_date DATE NOT NULL,
    num_people INT NOT NULL,
    status ENUM('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
    total_cost DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (client_id) REFERENCES client(id_client) ON DELETE CASCADE,
    FOREIGN KEY (tour_id) REFERENCES tour(id_tour) ON DELETE RESTRICT
);

-- Тут мають бути всі інші таблиці (Location, Tour, Client, Guide, Feedback, проміжні таблиці).
-- А також усі тригери (для розрахунку ціни та перевірки дати).
-- І представлення (Views) для звітів.