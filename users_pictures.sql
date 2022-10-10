-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 10 2022 г., 16:05
-- Версия сервера: 8.0.30-0ubuntu0.20.04.2
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `users_pictures`
--
CREATE DATABASE IF NOT EXISTS `users_pictures` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `users_pictures`;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_info`
--

CREATE TABLE `personal_info` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `sex` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `personal_info`
--

INSERT INTO `personal_info` (`user_id`, `first_name`, `last_name`, `birth_date`, `sex`) VALUES
(1, 'Adam', 'Meloniys', '2002-05-27', 'M');

-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE `pictures` (
  `pic_id` int NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `alt_text` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `pictures`
--

INSERT INTO `pictures` (`pic_id`, `url`, `alt_text`) VALUES
(1, 'https://mobimg.b-cdn.net/703ec2a.jpeg', 'Those are the same stars, and that is the same moon, that look down upon your brothers and sisters, and which they see as they look up to them, though they are ever so far away from us, and each other'),
(2, 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fb8.jpg', 'I love to think that animals and humans and plants and fishes and trees and stars and the moon are all connected.'),
(3, 'https://www.google.com/imgres?imgurl=https%3A%2%5%.png', 'Always remember we are under the same sky, looking at the same moon.'),
(4, 'https://www.google.com/imgres?imgurl=https%3A%2F%.png', 'Be both soft and wild. Just like the moon. Or the storm. Or the sea.'),
(5, 'https://www.google.com/imgres?imgurl=https%3A%2F2Ffi.jpeg', 'Drag me to the moon, to catch a star and seize its brilliance as I\'m swept up in amorphous dust.'),
(6, 'https://www.google.com/imgres?imgurl=https%3A%2F%2F99px.png', 'With freedom, books, flowers, and the moon who could not be happy?');

-- --------------------------------------------------------

--
-- Структура таблицы `users_pictures`
--

CREATE TABLE `users_pictures` (
  `pic_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `picture_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users_pictures`
--

INSERT INTO `users_pictures` (`pic_id`, `user_id`, `title`, `create_date`, `picture_type`) VALUES
(5, 4, 'Moon', '2014-12-22', 'regular'),
(2, 1, 'Night', '2020-07-16', 'icon'),
(1, 5, 'Moonlight', '2019-09-23', 'regular'),
(4, 3, 'Black', '2022-12-29', 'icon'),
(6, 1, 'Black_water', '2022-09-16', 'icon'),
(1, 6, 'Moonlight', '2019-10-01', 'regular'),
(1, 3, 'Moonlight', '2020-02-27', 'regular');

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`user_id`, `email`, `nickname`) VALUES
(1, 'meow@mail.com', 'Meowinsly'),
(2, 'opki@gmail.com', 'Hopkins'),
(3, 'Poly@mail.ru', 'Fairytale'),
(4, 'sabotag@gmail.com', 'Solok'),
(5, 'lalisa87@mail.ru', 'Lisa'),
(6, 'Wolop@gmail.com', 'TruePloc');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `personal_info`
--
ALTER TABLE `personal_info`
  ADD KEY `personal_info_user_id_fk` (`user_id`);

--
-- Индексы таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`pic_id`);

--
-- Индексы таблицы `users_pictures`
--
ALTER TABLE `users_pictures`
  ADD KEY `pictures_pic_id_fk` (`pic_id`),
  ADD KEY `user_info_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `personal_info`
--
ALTER TABLE `personal_info`
  ADD CONSTRAINT `personal_info_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `users_pictures`
--
ALTER TABLE `users_pictures`
  ADD CONSTRAINT `pictures_pic_id_fk` FOREIGN KEY (`pic_id`) REFERENCES `pictures` (`pic_id`),
  ADD CONSTRAINT `user_info_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
