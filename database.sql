CREATE DATABASE `dataBase`;
USE `dataBase`;

CREATE TABLE `ip_destino` (
  `id` int(11) NOT NULL,
  `ip_destino` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ip_origem` (
  `id` int(11) NOT NULL,
  `ip_origem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `processos_execucao` (
  `id` int(11) NOT NULL,
  `processos_execucao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxa_uso_disco` (
  `id` int(11) NOT NULL,
  `uso_disco` float NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxa_uso_processador` (
  `id` int(11) NOT NULL,
  `uso_processador` float NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxa_uso_memoria` (
  `id` int(11) NOT NULL,
  `utilizacao_memoria` float NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ip_destino`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ip_origem`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `processos_execucao`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `taxa_uso_disco`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `taxa_uso_processador`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `taxa_uso_memoria`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ip_destino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `ip_origem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `processos_execucao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `taxa_uso_disco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `taxa_uso_processador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `taxa_uso_memoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
