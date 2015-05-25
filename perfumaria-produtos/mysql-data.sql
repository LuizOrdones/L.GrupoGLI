-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 25/05/2015 às 20:00
-- Versão do servidor: 5.5.43-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `perfumaria`
--

--
-- Fazendo dump de dados para tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome_produto`, `genero_produto`, `marca_produto`, `dataInclusao_produto`, `valorDeCusto_produto`, `valorDeVenda_produto`, `dataDeFabricacao_produto`, `validade_produto`, `categoria_produto`, `quantidade_produto`, `quantidadeMililitros_produto`, `incluido`) VALUES
(137, 'Pedro', 'Unissex', 'Velho', NULL, 0, 0, NULL, NULL, NULL, 55, 1000, 0),
(138, 'Pedro', 'Unissex', 'Velho', NULL, 0, 0, NULL, NULL, NULL, 0, 600, 0);

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`login`, `senha`) VALUES
('ilderlan', '340944ok');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
