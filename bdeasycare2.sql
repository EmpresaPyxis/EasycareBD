-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Jul-2020 às 08:13
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdeasycare2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcartao`
--

CREATE TABLE `tbcartao` (
  `idCartao` int(11) NOT NULL,
  `nomeCartao` varchar(100) NOT NULL,
  `cvvCartao` int(11) NOT NULL,
  `numCartao` int(11) NOT NULL,
  `validadeCartao` date NOT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcategoria`
--

CREATE TABLE `tbcategoria` (
  `idCategoria` int(11) NOT NULL,
  `nomeCategoria` varchar(30) NOT NULL,
  `idTipoProduto` int(11) NOT NULL,
  `idEstabelecimento` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcategoria`
--

INSERT INTO `tbcategoria` (`idCategoria`, `nomeCategoria`, `idTipoProduto`, `idEstabelecimento`) VALUES
(1, 'N sei', 1, 1),
(2, 'Higiene pessoal', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcategoriamed`
--

CREATE TABLE `tbcategoriamed` (
  `idCategoriaMed` int(11) NOT NULL,
  `nomeCategoria` varchar(30) NOT NULL,
  `idEstabelecimento` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcategoriamed`
--

INSERT INTO `tbcategoriamed` (`idCategoriaMed`, `nomeCategoria`, `idEstabelecimento`) VALUES
(1, 'Gripal', 7),
(2, 'Enjôo', 7),
(3, 'Antipirético', 7),
(4, 'Analgésico', 7),
(13, 'Febril', NULL),
(12, 'Febril', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `idCliente` int(11) NOT NULL,
  `nomeCliente` varchar(100) NOT NULL,
  `cpfCliente` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcliente`
--

INSERT INTO `tbcliente` (`idCliente`, `nomeCliente`, `cpfCliente`) VALUES
(3, 'Juarez Matos', '974.308.540-87');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcupom`
--

CREATE TABLE `tbcupom` (
  `idCupom` int(11) NOT NULL,
  `cupom` varchar(30) NOT NULL,
  `valorCupom` double NOT NULL,
  `idEstabelecimento` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcupom`
--

INSERT INTO `tbcupom` (`idCupom`, `cupom`, `valorCupom`, `idEstabelecimento`) VALUES
(1, '10%OFF', 10, 0),
(2, '10%OFF', 10, 19),
(3, '10%OFF', 10, 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcuponscliente`
--

CREATE TABLE `tbcuponscliente` (
  `idCuponsCliente` int(11) NOT NULL,
  `idCupom` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcuponscliente`
--

INSERT INTO `tbcuponscliente` (`idCuponsCliente`, `idCupom`, `idCliente`) VALUES
(1, 1, 78),
(2, 1, 78),
(3, 1, 78),
(4, 1, 78),
(5, 1, 78),
(6, 1, 78),
(7, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbenderecocliente`
--

CREATE TABLE `tbenderecocliente` (
  `idEnderecoCliente` int(11) NOT NULL,
  `logCliente` varchar(100) NOT NULL,
  `numLogCliente` varchar(6) NOT NULL,
  `complementoLogCliente` varchar(40) DEFAULT NULL,
  `bairroLogCliente` varchar(50) NOT NULL,
  `cidadeLogCliente` varchar(50) NOT NULL,
  `ufLogCliente` varchar(2) NOT NULL,
  `cepLogCliente` varchar(9) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idLocal` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbenderecocliente`
--

INSERT INTO `tbenderecocliente` (`idEnderecoCliente`, `logCliente`, `numLogCliente`, `complementoLogCliente`, `bairroLogCliente`, `cidadeLogCliente`, `ufLogCliente`, `cepLogCliente`, `idCliente`, `idLocal`) VALUES
(1, 'Rua das procelanas', '45', NULL, 'São Miguel', 'São Paulo', 'SP', '12345678', 1, 1),
(2, 'Rua Guabirobinha', '33', 'sobrado', 'Jardim dos Ipes', 'São Paulo', 'SP', '08161-410', 78, 1),
(3, 'Travessa Bom Jesus de Goias', '33', 'sobrado', 'Jardim dos Ipes', 'São Paulo', 'SP', '08161-410', 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbestabelecimento`
--

CREATE TABLE `tbestabelecimento` (
  `idEstabelecimento` int(11) NOT NULL,
  `nomeEstabelecimento` varchar(50) NOT NULL,
  `cnpjEstabelecimento` varchar(18) NOT NULL,
  `logEstabelecimento` varchar(100) NOT NULL,
  `numLogEstabelecimento` int(11) NOT NULL,
  `cepLogEstabelecimento` varchar(9) NOT NULL,
  `bairroLogEstabelecimento` varchar(50) NOT NULL,
  `cidadeLogEstabelecimento` varchar(50) NOT NULL,
  `ufLogEstabelecimento` varchar(2) NOT NULL,
  `taxaDeEntregaEstabelecimento` double DEFAULT NULL,
  `fotoEstabelecimento` varchar(100) DEFAULT NULL,
  `idStatusEstabelecimento` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbestabelecimento`
--

INSERT INTO `tbestabelecimento` (`idEstabelecimento`, `nomeEstabelecimento`, `cnpjEstabelecimento`, `logEstabelecimento`, `numLogEstabelecimento`, `cepLogEstabelecimento`, `bairroLogEstabelecimento`, `cidadeLogEstabelecimento`, `ufLogEstabelecimento`, `taxaDeEntregaEstabelecimento`, `fotoEstabelecimento`, `idStatusEstabelecimento`) VALUES
(18, 'Farmácia do zé', '44.496.575/0001-12', 'rua guabirobinha', 120, '08161-410', 'jd dos ipes', 'sao paulo', 'SP', 50, '', 1),
(19, 'Droga+', '12345678912', 'Av Marechal Tito', 32, '08090-110', 'Itaim Paulista', 'São Paulo', 'SP', 10, '8e1e8d20cbc4fe6243467c59c7bbcfff.png', 1),
(21, 'Admin', '1234567898', 'Av Marechal Tito', 32, '08140-125', 'Itaim Paulista', 'São Paulo', 'SP', 15, 'b4355095f352488fee6aff3e8eecefcd.jpg', 1),
(22, 'Admin', '132456789', 'Av Marechal Tito', 32, '08140-125', 'ipê', 'São Paulo', 'SP', 1500, NULL, 1),
(23, 'FarmaTeste', '30.424.807/0001-12', 'Av Marechal Tito', 159, '08140-123', 'Itaim Paulista', 'São Paulo', 'SP', 15, 'e5babd9fd9ef2973f16368aa1cfd65e0', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfabricante`
--

CREATE TABLE `tbfabricante` (
  `idFabricante` int(11) NOT NULL,
  `nomeFabricante` varchar(100) NOT NULL,
  `cnpjFabricante` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbfabricante`
--

INSERT INTO `tbfabricante` (`idFabricante`, `nomeFabricante`, `cnpjFabricante`) VALUES
(1, 'Fabricante Teste', 12345678);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfonecliente`
--

CREATE TABLE `tbfonecliente` (
  `idFoneCliente` int(11) NOT NULL,
  `numFoneCliente` varchar(20) NOT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbfonecliente`
--

INSERT INTO `tbfonecliente` (`idFoneCliente`, `numFoneCliente`, `idCliente`) VALUES
(1, '(11) 94179-0817', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfoneestabelecimento`
--

CREATE TABLE `tbfoneestabelecimento` (
  `idFoneEstabelecimento` int(11) NOT NULL,
  `numFoneEstabelecimento` varchar(13) NOT NULL,
  `idEstabelecimento` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbfoneestabelecimento`
--

INSERT INTO `tbfoneestabelecimento` (`idFoneEstabelecimento`, `numFoneEstabelecimento`, `idEstabelecimento`) VALUES
(9, '1125659856', 18),
(8, '1127685622', 17),
(10, '123465789', 19),
(11, '123465789', 20),
(12, '123465789', 21),
(13, '123465789', 22),
(14, '11915037384', 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbformapagamento`
--

CREATE TABLE `tbformapagamento` (
  `idFormaPagamento` int(11) NOT NULL,
  `tipoPagamento` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbformapagamento`
--

INSERT INTO `tbformapagamento` (`idFormaPagamento`, `tipoPagamento`) VALUES
(1, 'Dinheiro'),
(2, 'Cartão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbitensvenda`
--

CREATE TABLE `tbitensvenda` (
  `idItensVenda` int(11) NOT NULL,
  `qtdItens` int(11) NOT NULL,
  `subTotalItens` double NOT NULL,
  `idProduto` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbitensvendamed`
--

CREATE TABLE `tbitensvendamed` (
  `idItensVendaMed` int(11) NOT NULL,
  `qtdItens` int(11) NOT NULL,
  `subTotalItens` double NOT NULL,
  `idMedicamento` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbitensvendamed`
--

INSERT INTO `tbitensvendamed` (`idItensVendaMed`, `qtdItens`, `subTotalItens`, `idMedicamento`) VALUES
(1, 1, 6.5, 28);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblaboratorio`
--

CREATE TABLE `tblaboratorio` (
  `idLaboratorio` int(11) NOT NULL,
  `nomeLaboratorio` varchar(50) NOT NULL,
  `cnpjLaboratorio` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tblaboratorio`
--

INSERT INTO `tblaboratorio` (`idLaboratorio`, `nomeLaboratorio`, `cnpjLaboratorio`) VALUES
(2, 'Medley', '79569927000105');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblocal`
--

CREATE TABLE `tblocal` (
  `idLocal` int(11) NOT NULL,
  `tipoLocal` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tblocal`
--

INSERT INTO `tblocal` (`idLocal`, `tipoLocal`) VALUES
(1, 'Casa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblogincliente`
--

CREATE TABLE `tblogincliente` (
  `idLoginCliente` int(11) NOT NULL,
  `emailCliente` varchar(100) NOT NULL,
  `senhaCliente` varchar(30) NOT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tblogincliente`
--

INSERT INTO `tblogincliente` (`idLoginCliente`, `emailCliente`, `senhaCliente`, `idCliente`) VALUES
(1, 'juarez@email.com', 'juju123456', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbloginestabelecimento`
--

CREATE TABLE `tbloginestabelecimento` (
  `idLoginEstabelecimento` int(11) NOT NULL,
  `emailEstabelecimento` varchar(100) NOT NULL,
  `senhaEstabelecimento` varchar(30) NOT NULL,
  `idEstabelecimento` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbloginestabelecimento`
--

INSERT INTO `tbloginestabelecimento` (`idLoginEstabelecimento`, `emailEstabelecimento`, `senhaEstabelecimento`, `idEstabelecimento`) VALUES
(12, 'farmaze@email.com', 'farmaze123456', 18),
(11, 'drogariasp@gmail.com', 'drogariasp123456', 17),
(13, 'drogamais@gmail.com', '123', 19),
(15, 'admin@admin.com', '123', 21),
(16, 'farmateste@gmail.com', '123', 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmedicamento`
--

CREATE TABLE `tbmedicamento` (
  `idMedicamento` int(11) NOT NULL,
  `composicaoMed` varchar(100) NOT NULL,
  `descMed` varchar(100) DEFAULT NULL,
  `descDosagem` varchar(11) NOT NULL,
  `precoMed` double NOT NULL,
  `idPosologia` int(11) DEFAULT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `idCategoriaMed` int(11) DEFAULT NULL,
  `idEstabelecimento` int(11) DEFAULT NULL,
  `recomendacao` varchar(100) DEFAULT NULL,
  `idTipoDosagem` int(11) DEFAULT NULL,
  `idTarja` int(11) DEFAULT NULL,
  `fotoMed` varchar(100) DEFAULT NULL,
  `idStatusProduto` int(11) NOT NULL,
  `statusPromocional` tinyint(4) DEFAULT NULL,
  `porcentagemDesconto` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbmedicamento`
--

INSERT INTO `tbmedicamento` (`idMedicamento`, `composicaoMed`, `descMed`, `descDosagem`, `precoMed`, `idPosologia`, `idLaboratorio`, `idCategoriaMed`, `idEstabelecimento`, `recomendacao`, `idTipoDosagem`, `idTarja`, `fotoMed`, `idStatusProduto`, `statusPromocional`, `porcentagemDesconto`) VALUES
(67, 'dipirona sodica', 'dipirona', '100', 50, 0, 2, 2, 18, '', 2, 1, '', 1, NULL, NULL),
(68, 'analgesicos', 'paracetamol', '100', 15, 0, 2, 1, 1, '', 1, 1, '', 1, NULL, NULL),
(91, 'analgesicos', 'paracetamol', '100', 15, 1, 2, 1, 21, '', 1, 1, 'bbdcfee5e9d3bf0283fce15201eaeebd.png', 1, NULL, NULL),
(88, '', '', '', 0, 0, 0, 0, 19, '', 0, 0, '1efefd3bcfa04def60ef24f029a184d8', 1, NULL, NULL),
(92, 'Analgesicos', 'Anadorr', '100', 15, 0, 0, 4, 23, '', 0, 0, '3953c59c9aaa1331fd3e3fdaa0ffe4db.png', 1, NULL, NULL),
(93, 'analgesicos', 'Anador', '100', 15, 1, 0, 1, 23, '', 1, 0, 'cc19279e26623b3a2454253dde42bbc2.png', 1, NULL, NULL),
(94, 'analgesicos', 'Anador', '100', 15, 1, 2, 2, 23, '', 1, 0, '9a2ec0023f2ecc9a7d1d2a066c68efe0.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbparcela`
--

CREATE TABLE `tbparcela` (
  `idParcela` int(11) NOT NULL,
  `qtdParcela` int(11) NOT NULL,
  `valorParcela` double NOT NULL,
  `idVenda` int(11) NOT NULL,
  `idCartao` int(11) NOT NULL,
  `idFormaPagamento` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbposologia`
--

CREATE TABLE `tbposologia` (
  `idPosologia` int(11) NOT NULL,
  `descPosologia` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbposologia`
--

INSERT INTO `tbposologia` (`idPosologia`, `descPosologia`) VALUES
(1, 'Comprimido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbproduto`
--

CREATE TABLE `tbproduto` (
  `idProduto` int(11) NOT NULL,
  `descProduto` varchar(100) DEFAULT NULL,
  `qtdMl` varchar(11) DEFAULT NULL,
  `fotoProduto` varchar(100) DEFAULT NULL,
  `precoProduto` double NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idFabricante` int(11) NOT NULL,
  `idEstabelecimento` int(11) NOT NULL,
  `idTipoDosagem` int(11) NOT NULL,
  `idStatusProduto` int(11) DEFAULT NULL,
  `statusPromocional` tinyint(4) DEFAULT NULL,
  `porcentagemDesconto` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbproduto`
--

INSERT INTO `tbproduto` (`idProduto`, `descProduto`, `qtdMl`, `fotoProduto`, `precoProduto`, `idCategoria`, `idFabricante`, `idEstabelecimento`, `idTipoDosagem`, `idStatusProduto`, `statusPromocional`, `porcentagemDesconto`) VALUES
(1, 'asdasd', '100', 'bcf488b4a18462fb0b5b9b1256d49fbf.png', 5, 2, 1, 19, 0, 0, NULL, NULL),
(2, 'asdasd', '100', 'bcf56ac28500fe4d41c8e5295d155277.png', 15, 2, 0, 19, 0, 0, NULL, NULL),
(3, 'asdasd', '100', 'aefaa9fd0e0787177dcda61368180a9c.png', 15, 2, 0, 19, 0, 0, NULL, NULL),
(4, 'asdasd', '100', '73e49b6cf8fffacb1fdad893c8626619.png', 15, 2, 1, 19, 0, 0, NULL, NULL),
(5, 'asdasd', '100', '707417a95fba606521af12f6195abba1.png', 5, 2, 1, 19, 0, 0, NULL, NULL),
(6, 'asdasd', '150', '68a36d9c8817926ae48690fc9f66a983.png', 10, 2, 1, 19, 0, 0, NULL, NULL),
(10, 'Shampoo', '500', '787f6673b2656771e1861b6473c2a64c.png', 25, 2, 1, 21, 1, 1, NULL, NULL),
(11, 'Shampoo', '150', '85c21efb4be96331056b1abd86bf588c.png', 17, 1, 1, 23, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpromocoesmed`
--

CREATE TABLE `tbpromocoesmed` (
  `idPromocoesMed` int(11) NOT NULL,
  `idMedicamento` int(11) DEFAULT NULL,
  `porcentagemDesconto` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpromocoesprod`
--

CREATE TABLE `tbpromocoesprod` (
  `idPromocoesProd` int(11) NOT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `porcentagemDesconto` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbrecomendacao`
--

CREATE TABLE `tbrecomendacao` (
  `idRecomendacao` int(11) NOT NULL,
  `descRecomendacao` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbstatusestabelecimento`
--

CREATE TABLE `tbstatusestabelecimento` (
  `idStatusEstabelecimento` int(11) NOT NULL,
  `descStatusEstabelecimento` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbstatusestabelecimento`
--

INSERT INTO `tbstatusestabelecimento` (`idStatusEstabelecimento`, `descStatusEstabelecimento`) VALUES
(1, 'Fechado'),
(2, 'Aberto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbstatusproduto`
--

CREATE TABLE `tbstatusproduto` (
  `idStatusProduto` int(11) NOT NULL,
  `descStatusProduto` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbstatusproduto`
--

INSERT INTO `tbstatusproduto` (`idStatusProduto`, `descStatusProduto`) VALUES
(1, 'Disponível'),
(2, 'Indisponível');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbstatusvenda`
--

CREATE TABLE `tbstatusvenda` (
  `idStatusVenda` int(11) NOT NULL,
  `descStatusVenda` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbstatusvenda`
--

INSERT INTO `tbstatusvenda` (`idStatusVenda`, `descStatusVenda`) VALUES
(1, 'Ativo'),
(2, 'Pendente'),
(3, 'Finalizado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtarja`
--

CREATE TABLE `tbtarja` (
  `idTarja` int(11) NOT NULL,
  `descTarja` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbtarja`
--

INSERT INTO `tbtarja` (`idTarja`, `descTarja`) VALUES
(1, 'MIPs'),
(2, 'Amarela'),
(3, 'Vermelha');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtipodosagem`
--

CREATE TABLE `tbtipodosagem` (
  `idTipoDosagem` int(11) NOT NULL,
  `tipoDosagem` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbtipodosagem`
--

INSERT INTO `tbtipodosagem` (`idTipoDosagem`, `tipoDosagem`) VALUES
(1, 'ML'),
(2, 'g');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtipoproduto`
--

CREATE TABLE `tbtipoproduto` (
  `idTipoProduto` int(11) NOT NULL,
  `tipoProduto` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbtipoproduto`
--

INSERT INTO `tbtipoproduto` (`idTipoProduto`, `tipoProduto`) VALUES
(1, 'Higiene');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbvenda`
--

CREATE TABLE `tbvenda` (
  `idVenda` int(11) NOT NULL,
  `dataVenda` date NOT NULL,
  `horaVenda` time NOT NULL,
  `subTotalVenda` double NOT NULL,
  `totalVenda` double NOT NULL,
  `observacaoVenda` varchar(100) DEFAULT NULL,
  `taxaEntrega` double DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `idEnderecoCliente` int(11) NOT NULL,
  `idCupom` int(11) DEFAULT NULL,
  `idEstabelecimento` int(11) NOT NULL,
  `idFormaPagamento` int(11) NOT NULL,
  `idStatusVenda` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `idMedicamento` int(11) DEFAULT NULL,
  `qtdProduto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbvenda`
--

INSERT INTO `tbvenda` (`idVenda`, `dataVenda`, `horaVenda`, `subTotalVenda`, `totalVenda`, `observacaoVenda`, `taxaEntrega`, `idCliente`, `idEnderecoCliente`, `idCupom`, `idEstabelecimento`, `idFormaPagamento`, `idStatusVenda`, `idProduto`, `idMedicamento`, `qtdProduto`) VALUES
(1, '2020-04-04', '12:56:11', 23.45, 23.45, 'Entrega no portão azul', NULL, 1, 1, NULL, 1, 1, 1, 1, 1, 0),
(3, '2020-05-06', '23:12:56', 6.56, 6.56, 'nenhuma', 5.66, 1, 1, NULL, 1, 1, NULL, NULL, 1, 0),
(4, '2020-07-12', '11:45:23', 23.5, 25, 'hm', 1.5, 1, 1, NULL, 1, 1, NULL, NULL, 1, 0),
(5, '2020-04-12', '18:45:23', 23.5, 25, 'hm', 1.5, 1, 1, NULL, 1, 1, NULL, NULL, 1, 0),
(6, '2020-07-12', '12:50:23', 23.5, 25, 'hm', 1.5, 1, 1, NULL, 1, 1, NULL, NULL, 1, 0),
(7, '2020-07-12', '11:45:23', 23.5, 25, 'hm', 1.5, 1, 1, NULL, 1, 1, NULL, NULL, 1, 0),
(8, '2020-06-01', '23:09:57', 20, 70, 'null', 50, 78, 2, 0, 2, 2, 1, 0, 1, 1),
(9, '2020-06-01', '23:19:04', 20, 70, 'null', 50, 78, 2, 0, 2, 2, 1, 0, 1, 1),
(10, '2020-06-01', '23:26:31', 20, 70, 'null', 50, 3, 3, 0, 2, 1, 1, 0, 1, 1),
(11, '2020-06-01', '23:46:25', 15, 65, 'null', 50, 3, 3, 0, 7, 1, 1, 0, 37, 1),
(12, '2020-06-01', '23:58:00', 15, 65, 'null', 50, 3, 3, 0, 7, 1, 2, 0, 37, 1),
(13, '2020-06-02', '05:14:06', 500, 550, 'null', 50, 3, 3, 0, 18, 1, 2, 0, 67, 10),
(14, '2020-06-02', '05:15:49', 500, 550, 'null', 50, 3, 3, 0, 18, 1, 2, 0, 67, 10),
(15, '2020-06-02', '05:17:02', 500, 495, 'null', 50, 3, 3, 1, 19, 1, 1, 0, 67, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbcartao`
--
ALTER TABLE `tbcartao`
  ADD PRIMARY KEY (`idCartao`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices para tabela `tbcategoria`
--
ALTER TABLE `tbcategoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `idTipoProduto` (`idTipoProduto`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`);

--
-- Índices para tabela `tbcategoriamed`
--
ALTER TABLE `tbcategoriamed`
  ADD PRIMARY KEY (`idCategoriaMed`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`);

--
-- Índices para tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `tbcupom`
--
ALTER TABLE `tbcupom`
  ADD PRIMARY KEY (`idCupom`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`);

--
-- Índices para tabela `tbcuponscliente`
--
ALTER TABLE `tbcuponscliente`
  ADD PRIMARY KEY (`idCuponsCliente`),
  ADD KEY `idCupom` (`idCupom`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices para tabela `tbenderecocliente`
--
ALTER TABLE `tbenderecocliente`
  ADD PRIMARY KEY (`idEnderecoCliente`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idLocal` (`idLocal`);

--
-- Índices para tabela `tbestabelecimento`
--
ALTER TABLE `tbestabelecimento`
  ADD PRIMARY KEY (`idEstabelecimento`),
  ADD KEY `idStatusEstabelecimento` (`idStatusEstabelecimento`);

--
-- Índices para tabela `tbfabricante`
--
ALTER TABLE `tbfabricante`
  ADD PRIMARY KEY (`idFabricante`);

--
-- Índices para tabela `tbfonecliente`
--
ALTER TABLE `tbfonecliente`
  ADD PRIMARY KEY (`idFoneCliente`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices para tabela `tbfoneestabelecimento`
--
ALTER TABLE `tbfoneestabelecimento`
  ADD PRIMARY KEY (`idFoneEstabelecimento`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`);

--
-- Índices para tabela `tbformapagamento`
--
ALTER TABLE `tbformapagamento`
  ADD PRIMARY KEY (`idFormaPagamento`);

--
-- Índices para tabela `tbitensvenda`
--
ALTER TABLE `tbitensvenda`
  ADD PRIMARY KEY (`idItensVenda`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices para tabela `tbitensvendamed`
--
ALTER TABLE `tbitensvendamed`
  ADD PRIMARY KEY (`idItensVendaMed`),
  ADD KEY `idMedicamento` (`idMedicamento`);

--
-- Índices para tabela `tblaboratorio`
--
ALTER TABLE `tblaboratorio`
  ADD PRIMARY KEY (`idLaboratorio`);

--
-- Índices para tabela `tblocal`
--
ALTER TABLE `tblocal`
  ADD PRIMARY KEY (`idLocal`);

--
-- Índices para tabela `tblogincliente`
--
ALTER TABLE `tblogincliente`
  ADD PRIMARY KEY (`idLoginCliente`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices para tabela `tbloginestabelecimento`
--
ALTER TABLE `tbloginestabelecimento`
  ADD PRIMARY KEY (`idLoginEstabelecimento`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`);

--
-- Índices para tabela `tbmedicamento`
--
ALTER TABLE `tbmedicamento`
  ADD PRIMARY KEY (`idMedicamento`),
  ADD KEY `idPosologia` (`idPosologia`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idCategoriaMed` (`idCategoriaMed`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`),
  ADD KEY `idRecomendacao` (`recomendacao`),
  ADD KEY `idTipoDosagem` (`idTipoDosagem`),
  ADD KEY `idTarja` (`idTarja`),
  ADD KEY `idStatusProduto` (`idStatusProduto`);

--
-- Índices para tabela `tbparcela`
--
ALTER TABLE `tbparcela`
  ADD PRIMARY KEY (`idParcela`),
  ADD KEY `idVenda` (`idVenda`),
  ADD KEY `idCartao` (`idCartao`),
  ADD KEY `idFormaPagamento` (`idFormaPagamento`);

--
-- Índices para tabela `tbposologia`
--
ALTER TABLE `tbposologia`
  ADD PRIMARY KEY (`idPosologia`);

--
-- Índices para tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idFabricante` (`idFabricante`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`),
  ADD KEY `idStatusProduto` (`idStatusProduto`);

--
-- Índices para tabela `tbpromocoesmed`
--
ALTER TABLE `tbpromocoesmed`
  ADD PRIMARY KEY (`idPromocoesMed`),
  ADD KEY `idMedicamento` (`idMedicamento`);

--
-- Índices para tabela `tbpromocoesprod`
--
ALTER TABLE `tbpromocoesprod`
  ADD PRIMARY KEY (`idPromocoesProd`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices para tabela `tbrecomendacao`
--
ALTER TABLE `tbrecomendacao`
  ADD PRIMARY KEY (`idRecomendacao`);

--
-- Índices para tabela `tbstatusestabelecimento`
--
ALTER TABLE `tbstatusestabelecimento`
  ADD PRIMARY KEY (`idStatusEstabelecimento`);

--
-- Índices para tabela `tbstatusproduto`
--
ALTER TABLE `tbstatusproduto`
  ADD PRIMARY KEY (`idStatusProduto`);

--
-- Índices para tabela `tbstatusvenda`
--
ALTER TABLE `tbstatusvenda`
  ADD PRIMARY KEY (`idStatusVenda`);

--
-- Índices para tabela `tbtarja`
--
ALTER TABLE `tbtarja`
  ADD PRIMARY KEY (`idTarja`);

--
-- Índices para tabela `tbtipodosagem`
--
ALTER TABLE `tbtipodosagem`
  ADD PRIMARY KEY (`idTipoDosagem`);

--
-- Índices para tabela `tbtipoproduto`
--
ALTER TABLE `tbtipoproduto`
  ADD PRIMARY KEY (`idTipoProduto`);

--
-- Índices para tabela `tbvenda`
--
ALTER TABLE `tbvenda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idEnderecoCliente` (`idEnderecoCliente`),
  ADD KEY `idCupom` (`idCupom`),
  ADD KEY `idEstabelecimento` (`idEstabelecimento`),
  ADD KEY `idFormaPagamento` (`idFormaPagamento`),
  ADD KEY `idStatusVenda` (`idStatusVenda`),
  ADD KEY `idItensVenda` (`idProduto`),
  ADD KEY `idItensVendaMed` (`idMedicamento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcartao`
--
ALTER TABLE `tbcartao`
  MODIFY `idCartao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbcategoria`
--
ALTER TABLE `tbcategoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbcategoriamed`
--
ALTER TABLE `tbcategoriamed`
  MODIFY `idCategoriaMed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbcupom`
--
ALTER TABLE `tbcupom`
  MODIFY `idCupom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbcuponscliente`
--
ALTER TABLE `tbcuponscliente`
  MODIFY `idCuponsCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tbenderecocliente`
--
ALTER TABLE `tbenderecocliente`
  MODIFY `idEnderecoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbestabelecimento`
--
ALTER TABLE `tbestabelecimento`
  MODIFY `idEstabelecimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `tbfabricante`
--
ALTER TABLE `tbfabricante`
  MODIFY `idFabricante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbfonecliente`
--
ALTER TABLE `tbfonecliente`
  MODIFY `idFoneCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbfoneestabelecimento`
--
ALTER TABLE `tbfoneestabelecimento`
  MODIFY `idFoneEstabelecimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tbformapagamento`
--
ALTER TABLE `tbformapagamento`
  MODIFY `idFormaPagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbitensvenda`
--
ALTER TABLE `tbitensvenda`
  MODIFY `idItensVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbitensvendamed`
--
ALTER TABLE `tbitensvendamed`
  MODIFY `idItensVendaMed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tblaboratorio`
--
ALTER TABLE `tblaboratorio`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tblocal`
--
ALTER TABLE `tblocal`
  MODIFY `idLocal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tblogincliente`
--
ALTER TABLE `tblogincliente`
  MODIFY `idLoginCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbloginestabelecimento`
--
ALTER TABLE `tbloginestabelecimento`
  MODIFY `idLoginEstabelecimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tbmedicamento`
--
ALTER TABLE `tbmedicamento`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de tabela `tbparcela`
--
ALTER TABLE `tbparcela`
  MODIFY `idParcela` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbposologia`
--
ALTER TABLE `tbposologia`
  MODIFY `idPosologia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tbpromocoesmed`
--
ALTER TABLE `tbpromocoesmed`
  MODIFY `idPromocoesMed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbpromocoesprod`
--
ALTER TABLE `tbpromocoesprod`
  MODIFY `idPromocoesProd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbrecomendacao`
--
ALTER TABLE `tbrecomendacao`
  MODIFY `idRecomendacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbstatusestabelecimento`
--
ALTER TABLE `tbstatusestabelecimento`
  MODIFY `idStatusEstabelecimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbstatusproduto`
--
ALTER TABLE `tbstatusproduto`
  MODIFY `idStatusProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbstatusvenda`
--
ALTER TABLE `tbstatusvenda`
  MODIFY `idStatusVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbtarja`
--
ALTER TABLE `tbtarja`
  MODIFY `idTarja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbtipodosagem`
--
ALTER TABLE `tbtipodosagem`
  MODIFY `idTipoDosagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbtipoproduto`
--
ALTER TABLE `tbtipoproduto`
  MODIFY `idTipoProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbvenda`
--
ALTER TABLE `tbvenda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
