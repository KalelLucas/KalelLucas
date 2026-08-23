-- ==========================================================
-- Banco de Dados: Imobiliária João de Barro
-- Disciplina: Banco de Dados
-- Objetivo: Controle de condomínios, apartamentos,
--           proprietários, garagens e síndicos
-- SGBD: MySQL (via MySQL Workbench)
-- ==========================================================

-- Cria o banco de dados caso ele ainda não exista.
-- utf8mb4 é a codificação que suporta acentos da língua portuguesa.
-- As crases (`) garantem que o nome fique exatamente como escrito
-- (sem crases, o Windows/XAMPP transformaria tudo em minúsculo).
CREATE DATABASE IF NOT EXISTS `ImobiliariaJoaoDeBarro`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

-- Seleciona o banco de dados recém-criado.
-- A partir daqui, todos os comandos são aplicados nele.
USE `ImobiliariaJoaoDeBarro`;

-- ==========================================================
-- ORDEM DE CRIAÇÃO DAS TABELAS:
--   1º) Sindico       → sem dependência (ninguém referencia ninguém)
--   2º) Condominio    → depende de Sindico
--   3º) Proprietario  → sem dependência
--   4º) Apartamento   → depende de Condominio e Proprietario
--   5º) Garagem       → depende de Apartamento
--
-- Essa ordem é OBRIGATÓRIA porque não dá pra criar uma tabela
-- com Foreign Key referenciando uma tabela que ainda não existe.
-- ==========================================================


-- ----------------------------------------------------------
-- TABELA: Sindico
-- Motivo: Primeira porque não depende de nenhuma outra.
--         Representa o síndico responsável por cada condomínio.
-- ----------------------------------------------------------
CREATE TABLE `Sindico` (

    -- Matrícula do síndico (identificador único).
    -- VARCHAR(20) = texto de até 20 caracteres.
    -- NOT NULL = campo obrigatório (não pode ficar vazio).
    `matricula`   VARCHAR(20)  NOT NULL,

    -- Nome completo do síndico.
    `nome`        VARCHAR(100) NOT NULL,

    -- Endereço do síndico.
    `endereco`    VARCHAR(200) NOT NULL,

    -- Telefone do síndico.
    -- Sem NOT NULL = campo OPCIONAL (aceita valor nulo).
    `telefone`    VARCHAR(20),

    -- Define matricula como CHAVE PRIMÁRIA (Primary Key).
    -- Garante que não existam dois síndicos com a mesma matrícula.
    PRIMARY KEY (`matricula`)

-- InnoDB é o motor do MySQL que suporta Foreign Keys.
-- Sem ele, os relacionamentos não funcionam.
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ----------------------------------------------------------
-- TABELA: Condominio
-- Motivo: Segunda porque depende de Sindico (precisa que
--         a tabela Sindico já exista para criar a Foreign Key).
--         Relacionamento com Sindico: 1:1
--         (cada condomínio tem APENAS UM síndico)
-- ----------------------------------------------------------
CREATE TABLE `Condominio` (

    -- Código identificador do condomínio.
    -- INT = número inteiro.
    -- AUTO_INCREMENT = o MySQL gera o número sozinho (1, 2, 3...).
    `codigo`           INT          NOT NULL AUTO_INCREMENT,

    -- Nome do condomínio (ex: "Residencial Palmeiras").
    `nome`             VARCHAR(100) NOT NULL,

    -- Endereço do condomínio.
    `endereco`         VARCHAR(200) NOT NULL,

    -- Matrícula do síndico responsável por este condomínio.
    -- Essa coluna é uma CHAVE ESTRANGEIRA (Foreign Key) —
    -- ela referencia a matrícula de um síndico que JÁ EXISTE
    -- na tabela Sindico.
    `matriculaSindico` VARCHAR(20)  NOT NULL,

    -- Chave primária da tabela Condominio.
    PRIMARY KEY (`codigo`),

    -- Cria a FOREIGN KEY que conecta Condominio ao Sindico.
    -- Nome da constraint: fkCondominioSindico
    -- (dar nome é boa prática pra identificar erros depois).
    CONSTRAINT `fkCondominioSindico`

        -- matriculaSindico é a coluna LOCAL (desta tabela).
        FOREIGN KEY (`matriculaSindico`)

        -- Referencia a coluna matricula da tabela Sindico.
        REFERENCES `Sindico`(`matricula`)

        -- Se a matrícula do síndico for alterada na tabela Sindico,
        -- a alteração se propaga automaticamente para cá.
        ON UPDATE CASCADE

        -- IMPIDE excluir um síndico que ainda tem condomínios.
        -- Protege contra exclusões acidentais.
        ON DELETE RESTRICT

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ----------------------------------------------------------
-- TABELA: Proprietario
-- Motivo: Terceira porque não depende de nenhuma outra.
--         Representa os donos dos apartamentos.
--         Um proprietário pode ter VÁRIOS apartamentos (1:N).
-- ----------------------------------------------------------
CREATE TABLE `Proprietario` (

    -- RG do proprietário (identificador natural e único).
    `rg`       VARCHAR(20)  NOT NULL,

    -- Nome completo do proprietário.
    `nome`     VARCHAR(100) NOT NULL,

    -- Telefone do proprietário (opcional).
    `telefone` VARCHAR(20),

    -- E-mail do proprietário (opcional).
    `email`    VARCHAR(100),

    -- RG como chave primária.
    -- Cada pessoa tem um RG único, então não haverá duplicatas.
    PRIMARY KEY (`rg`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ----------------------------------------------------------
-- TABELA: Apartamento
-- Motivo: Quarta porque depende de Condominio e Proprietario.
--         Relacionamentos:
--           - Condominio → Apartamento = 1:N
--             (um condomínio tem VÁRIOS apartamentos)
--           - Proprietario → Apartamento = 1:N
--             (um proprietário pode ter VÁRIOS apartamentos)
-- ----------------------------------------------------------
CREATE TABLE `Apartamento` (

    -- Número do apartamento (ex: 101, 202, 501).
    `numero`           INT         NOT NULL,

    -- Tipo do apartamento.
    -- ENUM restringe os valores a APENAS 'Padrão' ou 'Cobertura'.
    -- Se tentar inserir qualquer outra coisa, o MySQL rejeita.
    -- Isso é "integridade de domínio" — garante dados válidos.
    `tipo`             ENUM('Padrão', 'Cobertura') NOT NULL,

    -- Código do condomínio ao qual este apartamento pertence.
    -- Foreign Key para Condominio.
    `codigoCondominio` INT         NOT NULL,

    -- RG do proprietário deste apartamento.
    -- Foreign Key para Proprietario.
    `rgProprietario`   VARCHAR(20) NOT NULL,

    -- CHAVE PRIMÁRIA COMPOSTA (duas colunas juntas).
    -- Por quê? Porque o número "101" pode existir em VÁRIOS
    -- condomínios. A combinação (101, 1) é diferente de (101, 2).
    -- Ou seja: apartamento 101 do condomínio 1 ≠ apartamento 101
    -- do condomínio 2.
    PRIMARY KEY (`numero`, `codigoCondominio`),

    -- Foreign Key: conecta o apartamento ao seu condomínio.
    CONSTRAINT `fkApartamentoCondominio`
        FOREIGN KEY (`codigoCondominio`)
        REFERENCES `Condominio`(`codigo`)
        ON UPDATE CASCADE
        -- Não permite excluir condomínio que tem apartamentos.
        ON DELETE RESTRICT,

    -- Foreign Key: conecta o apartamento ao seu proprietário.
    CONSTRAINT `fkApartamentoProprietario`
        FOREIGN KEY (`rgProprietario`)
        REFERENCES `Proprietario`(`rg`)
        ON UPDATE CASCADE
        -- Não permite excluir proprietário que tem apartamentos.
        ON DELETE RESTRICT

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ----------------------------------------------------------
-- TABELA: Garagem
-- Motivo: Última porque depende de Apartamento.
--         Relacionamento: Apartamento → Garagem = 1:1
--         (cada apartamento tem UMA ÚNICA garagem)
-- ----------------------------------------------------------
CREATE TABLE `Garagem` (

    -- Número do apartamento ao qual esta garagem pertence.
    -- Junto com codigoCondominio, forma a FK para Apartamento.
    `numeroApartamento` INT         NOT NULL,

    -- Código do condomínio (necessário porque a PK de
    -- Apartamento é composta por duas colunas).
    `codigoCondominio`  INT         NOT NULL,

    -- Número identificador da própria garagem (ex: G01, G02).
    `numero`            INT         NOT NULL,

    -- Tipo da garagem.
    -- Note: "Coberta" (com 'a') é diferente de "Cobertura"
    -- dos apartamentos — aqui é o tipo da vaga de garagem.
    `tipo`              ENUM('Padrão', 'Coberta') NOT NULL,

    -- TRUQUE DO RELACIONAMENTO 1:1:
    -- A PK de Garagem É A PRÓPRIA FK para Apartamento.
    -- Isso garante que cada apartamento só pode ter UMA garagem,
    -- porque PK não aceita valores duplicados.
    -- Se tentar inserir uma segunda garagem pro mesmo apartamento,
    -- o MySQL rejeita por duplicidade de PK.
    PRIMARY KEY (`numeroApartamento`, `codigoCondominio`),

    -- Foreign Key composta: referencia a PK composta de Apartamento.
    -- As DUAS colunas precisam bater com as DUAS colunas
    -- referenciadas na tabela Apartamento.
    CONSTRAINT `fkGaragemApartamento`
        FOREIGN KEY (`numeroApartamento`, `codigoCondominio`)
        REFERENCES `Apartamento`(`numero`, `codigoCondominio`)
        ON UPDATE CASCADE

        -- CASCADE na exclusão: se o apartamento for apagado,
        -- a garagem também some automaticamente.
        -- Faz sentido porque a garagem não existe sem o apartamento.
        ON DELETE CASCADE,

    -- Garante que não existam duas garagens com o mesmo número
    -- dentro do mesmo condomínio (ex: não ter duas "G01"
    -- no mesmo condomínio).
    CONSTRAINT `unGaragemNumero`
        UNIQUE (`numero`, `codigoCondominio`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ==========================================================
-- VERIFICAÇÕES
-- Comandos para confirmar que tudo foi criado corretamente.
-- Execute UM POR UM para ver os resultados no Workbench.
-- ==========================================================

-- Lista todas as tabelas do banco de dados.
-- Esperado: 5 tabelas (Apartamento, Condominio, Garagem,
--            Proprietario, Sindico)
SHOW TABLES;

-- Mostra a estrutura de cada tabela (colunas, tipos,
-- se aceita NULL, qual é a chave primária, etc.)
-- Key = PRI → Chave Primária
-- Key = MUL → Chave Estrangeira (Foreign Key)
DESCRIBE `Sindico`;
DESCRIBE `Condominio`;
DESCRIBE `Proprietario`;
DESCRIBE `Apartamento`;
DESCRIBE `Garagem`;