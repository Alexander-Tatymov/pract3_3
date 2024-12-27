CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) UNIQUE NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password_hash NVARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Cars (
    car_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    make NVARCHAR(50),
    model NVARCHAR(50),
    year INT,
    color NVARCHAR(30),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Discussions (
    discussion_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    title NVARCHAR(100),
    content NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Maintenance_Tips (
    tip_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    car_id INT,
    tip NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE CASCADE
);

CREATE TABLE Trips (
    trip_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    destination NVARCHAR(100),
    date DATETIME,
    description NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

INSERT INTO Users (username, email, password_hash) VALUES
('user1', 'user1@example.com', 'hashed_password1'),
('user2', 'user2@example.com', 'hashed_password2'),
('user3', 'user3@example.com', 'hashed_password3');

INSERT INTO Cars (user_id, make, model, year, color) VALUES
(1, 'Toyota', 'Camry', 2020, 'Black'),
(1, 'Honda', 'Civic', 2018, 'White'),
(2, 'Ford', 'Mustang', 2021, 'Red'),
(3, 'Tesla', 'Model 3', 2022, 'Blue');

INSERT INTO Discussions (user_id, title, content) VALUES
(1, 'Новые технологии в автомобилях', 'Обсуждаем последние новшества в автомобильной индустрии.'),
(2, 'Лучшие советы по уходу за автомобилем', 'Делимся советами по уходу за автомобилем.'),
(3, 'Проблемы с электромобилями', 'Обсуждение проблем и решений для электромобилей.');

INSERT INTO Maintenance_Tips (user_id, car_id, tip) VALUES
(1, 1, 'Регулярно проверяйте уровень масла.'),
(1, 2, 'Меняйте воздушный фильтр каждые 15,000 км.'),
(2, 3, 'Следите за состоянием тормозов.'),
(3, 4, 'Заряжайте электромобиль на ночь.');

INSERT INTO Trips (user_id, destination, date, description) VALUES
(1, 'Сочи', '2023-06-15 10:00:00', 'Совместная поездка на море.'),
(2, 'Казань', '2023-07-20 09:00:00', 'Поездка на фестиваль.'),
(3, 'Москва', '2023-08-05 12:00:00', 'Посещение выставки автомобилей.');
