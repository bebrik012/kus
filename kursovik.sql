-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 24 2024 г., 17:26
-- Версия сервера: 10.8.4-MariaDB
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kursovik`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Булочки', '3.jpg'),
(2, 'Хлеб', '6.jpg'),
(3, 'Пироги', '4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tovar_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `description`, `tovar_id`, `user_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(8, 'nice', 1, 16, 1716540991, 1716540991, 16, 16),
(9, 'Вкусная плюшка, объедение!', 1, 16, 1716544037, 1716544037, 16, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `kurier`
--

CREATE TABLE `kurier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `kurier`
--

INSERT INTO `kurier` (`id`, `user_id`) VALUES
(1, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `tovar`
--

CREATE TABLE `tovar` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tovar`
--

INSERT INTO `tovar` (`id`, `name`, `description`, `image`, `price`, `category_id`) VALUES
(1, 'Плюшка', 'Сдобная, сладкая, пышная домашняя выпечка! Сладкие булочки сердечки с сахаром довольно популярны. ', '1.jpg', 40, 1),
(2, 'Булочка с корицей', 'Здесь все волшебно: название, процесс приготовления, результат и, конечно же, вкус!', '2.jpg', 50, 1),
(3, 'Круассан', 'Классический круассан с добавлением вареного сгущенного молока.', '3.jpg', 60, 1),
(4, 'Яблочный пирог', 'Нежное тесто и много вкусной начинки. Великолепный вкус простого рецепта!', '4.jpg', 320, 3),
(5, 'Пирог с курицей и капустой', 'Дрожжевой пирог с начинкой из слегка обжаренной капусты и курицы: нежнейшее сочетание вкусов!', '15.jpg', 370, 3),
(6, 'Пирог с фаршем и картофелем', 'Классический дрожжевой пирог с начинкой из молотого мяса собственного производства и картофеля.', '52.jpg', 400, 3),
(7, 'Хлеб Сила ржи', 'Само зерно ржи содержит больше витаминов, аминокислот и микроэлементов, чем зерно пшеницы. ', '6.jpg', 50, 2),
(8, 'Хлеб ржаной', 'Чудесный хлеб всем любителям ржаного заварного хлеба', '17.jpg', 60, 2),
(9, 'Русская булка', 'Особенностью этого хлеба являются хрустящая корочка и мякиш, неравномерно распределённой пористостью и ароматностью.', '8.jpg', 70, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(21) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accessToken` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authKey` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `surname`, `patronymic`, `phone`, `email`, `accessToken`, `authKey`, `updated_at`, `created_at`, `role`) VALUES
(16, 'maria', '$2y$13$kg3HzygTT.Xv4vbCcaxpl.Co.ij5qCh44GBY.NOF675WzgP.D67xa', 'Марья', 'Бобкова', 'Ивановна', '+7 (912) 674-84-49', 'maria@mail.ru', 'L4hypd3oqyeF9OBfO2gnsuSYwwJCVVHt', 'IX7K0m15JsYAP1o6T6pw-99T3Ls4PjEb', 1714982829, 1714982829, 0),
(17, 'admin', '$2y$13$HStldF2316hQ66nxeqtGDu4rmHGYutijJB0TWPhzwqWMSDpoEwl3G', 'Анастасия ', 'Бердникова', 'Вячеславовна', '+7 (912) 523-65-34', 'nnnberdnikova@mail.ru', 'xlJ65rsKuVHNAnISLEyZEsnspXJmNYhw', 'GYaZJsyycMkS953nWpF2GNFr_-tS02oK', 1715594985, 1715594985, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz`
--

CREATE TABLE `zakaz` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kolichestvo` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `tovar_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kurier_id` int(11) DEFAULT 1,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `zakaz`
--

INSERT INTO `zakaz` (`id`, `name`, `surname`, `patronymic`, `phone`, `kolichestvo`, `status`, `tovar_id`, `user_id`, `kurier_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(26, 'Анастасия', 'Сергеев', 'Вячеславовна', '+7 (954) 854-98-75', 1, 0, 1, 16, 1, 1716540804, 1716540804, 16, 16),
(27, 'Петр', 'Петров', 'Петрович', '+7 (954) 854-98-75', 5, 0, 3, 16, 1, 1716545083, 1716545083, 17, 17);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tovar_id` (`tovar_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Индексы таблицы `kurier`
--
ALTER TABLE `kurier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `tovar`
--
ALTER TABLE `tovar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`tovar_id`,`user_id`),
  ADD KEY `kurier_id` (`kurier_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `kurier`
--
ALTER TABLE `kurier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tovar`
--
ALTER TABLE `tovar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`tovar_id`) REFERENCES `tovar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `kurier`
--
ALTER TABLE `kurier`
  ADD CONSTRAINT `kurier_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tovar`
--
ALTER TABLE `tovar`
  ADD CONSTRAINT `tovar_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD CONSTRAINT `zakaz_ibfk_1` FOREIGN KEY (`kurier_id`) REFERENCES `kurier` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zakaz_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zakaz_ibfk_3` FOREIGN KEY (`tovar_id`) REFERENCES `tovar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zakaz_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zakaz_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
