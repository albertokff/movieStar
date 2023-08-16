-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Ago-2023 às 22:28
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `moviestar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `movies`
--

CREATE TABLE `movies` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `trailer` varchar(150) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `users_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `image`, `trailer`, `category`, `length`, `users_id`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'Primeiro filme da famosa SAGA Harry Potter!', '96fb874fe2be9b3dd1333b11bfb0759ffa7c0b91a3e654d49c9144807d7718578746cc45af7d419ac9555a199af53567aba1627a6680221afbe6f5b9.jpg', 'https://www.youtube.com/embed/9fIObnIGMlI', 'Fantasia / Ficção', '2h', 3),
(3, 'Wall-E', 'Filme sobre ciência.', '74d48626aa62e7fff3b60da9a18c0d492650955ae922263aaacc1a69244db6eed62e909207bcdab61bfe68c330208ecd5da73c97d861ab2f316af3c8.jpg', 'https://www.youtube.com/embed/CZ1CATNbXg0', 'Fantasia / Ficção', '2h', 4),
(4, 'A Fantástica Fábrica de Chocolates', 'Charlie Bucket é um garoto pobre que vive com os pais (Senhor e Senhora Bucket) e avós (Joe, Georgina, Josephine e George Bucket) numa pequena e miserável casa (provavelmente em Londres). Ele é um grande fã de chocolate, do qual ganha apenas uma barra e somente no dia de seu aniversário, da marca do maior fabricante de chocolate do país: Willy Wonka, cuja enorme e enigmática fábrica está situada bem perto de sua humilde casa.', '0233ef820441938b9e76ccbe948af49082ec5e0c694b4a451405d9c41698f7bd596a2d5615c02fbf7b4591a631d9e3295984ed203e3e268021696039.jpg', 'https://www.youtube.com/embed/tcO90lUlHRU', 'Comédia', '2h', 4),
(5, 'Need For Speed', 'Filme de corrida e ação baseado na famosa sequência de games de corrida.', 'fab6b1e4d167c7f7ba7e1620ff9576727c8b4d1c7882ed134836b022e4958202710aa323ab8a772bd8fa3048b09575ff156e79060803af8eab247aed.jpg', 'https://www.youtube.com/embed/9ADox0zXqd4', 'Ação', '1,5h', 5),
(6, 'Fúria de Titãs', 'Fúria de Titãs. Filme que conta a história do semideus Perseu, filho de Zeus!', '762b28bca134cd3954e51dbb089a9e4cd7fd615163a79affebc3094edd0dc1a9a1fb7b468bc11f5958f8890c3020e0fb911015d85afcc0541886e17d.jpg', 'https://www.youtube.com/embed/RGeD4joet_Y', 'Fantasia / Ficção', '1,5h', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `users_id` int(11) UNSIGNED DEFAULT NULL,
  `movies_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `review`, `users_id`, `movies_id`) VALUES
(4, 3, 'Soube prender minha atenção. Uma história com engajamento do público!', 5, 1),
(5, 5, 'filme bom', 5, 1),
(6, 10, 'Excelente filme, meus filhos adoraram!!', 5, 3),
(7, 10, 'Um prato cheio para os que gostam de MUITA ação!!', 3, 5),
(8, 7, 'Gostei de assistir! Lembrou a minha infância.', 4, 1),
(9, 10, 'Adorei o filme! Super recomendo.', 4, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `token`, `bio`) VALUES
(3, 'Diogo', 'Kirchoff', 'kirchoffalberto@gmail.com', '$2y$10$sWCjzUPgkzaP4O3BfPM7redhb6Xq8kpyvXLkXlczjuQrqlhtxU1WS', '9adbd97efc46147007d61cca1793715072c9344e7074eae615f99304815899b95f79a103a8ee36ae293950d1b86da7153d7d33b1a8d06b764841055b.jpg', '48ebc6b89615215697e4e4ef92ed444c7eda68d6715b32dc5817c552008e1e35307ea350de93d6948ebd105f07bd6cad069d', 'Sou um bom programador e gosto de estudar! Compilou?'),
(4, 'Albertino', 'RK', 'diogo.kirchoff@soluct.com.br', '$2y$10$pBJ/UvGIWhbywWBiosvivuZf5IXOB4vos/fy1P01bOrCaYeGXYeta', '4f1da889e80a6ebc3db513c3fcfe841412448c3bcd13691939f004c10195eae0cbc431964d1c9efa6ce9984c1f843ebf7e779902494f8c152567b540.jpg', '292c99da3a41f19cf12a921aae40a47ffef173703f36d1ff3e80d44421315b0b794f419c2bb80b1ec03501506b6dcdf2fe48', 'Atleta de corrida.'),
(5, 'Baulers', 'Garrinson', 'ribeirinho@teste.com', '$2y$10$.6ZaM46gwSBSGhNlrLlNse.BKJLy06yVzkn3ZSdwoitzoFGObbMGy', 'f1568bc0b17b5923f88930b60983f097dd17685f3bc3e4ee83f1f6ff76085b1cd380c529f0159442da7e88b2b57e6128b5fed6126e06ef1170be4046.jpg', 'ff7255ba19593978741952ee7510297a833e07f8af0c44510aed44b1167e11f741e638295cbc88d5936823cfebedd9840076', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Índices para tabela `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `movies_id` (`movies_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
