-- EXERCICIO AULA 2
CREATE SCHEMA IF NOT EXISTS `ExercicioAula2` DEFAULT CHARACTER SET utf8;
USE `ExercicioAula2`;
CREATE TABLE Estudantes(
nome VARCHAR(255),
email VARCHAR(255),
telefone VARCHAR(255),
altura DECIMAL(3,2),
aprovado TINYINT(1)
) ENGINE = InnoDB;

INSERT INTO Estudantes (nome, email, telefone, altura, aprovado) VALUES ('João Paulo', 'jpapim@gmail.com', '3345-0909', 1.68, 1);
INSERT INTO Estudantes (nome, email, telefone, altura, aprovado) VALUES ('José Paulo', 'jose@gmail.com', '3345-5555', 1.88, 0);
INSERT INTO Estudantes (nome, email, telefone, altura, aprovado) VALUES ('Maria', 'maria@gmail.com', '3345-8888', 1.98, 1);
INSERT INTO Estudantes (nome, email, telefone, altura, aprovado) VALUES ('Joana', 'joana@gmail.com', '3345-6666', 1.48, 0);
INSERT INTO Estudantes (nome, email, telefone, altura, aprovado) VALUES ('Josefina', 'josefina@gmail.com', '3345-8765', 1.58, 0);


-- SUBCONSULTAS
CREATE SCHEMA IF NOT EXISTS `subconsultas` DEFAULT CHARACTER SET utf8;
USE `subconsultas`;

CREATE TABLE IF NOT EXISTS `subconsultas`.`Aluno`(
id INTEGER NOT NULL,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
dataNascimento DATETIME,
PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `subconsultas`.`Turma`(
id INTEGER NOT NULL,
inicio DATETIME,
fim DATETIME,
observacoes LONGTEXT,
PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `subconsultas`.`AlunoTurma`(
aluno_id INTEGER NOT NULL,
turma_id INTEGER NOT NULL,
PRIMARY KEY (aluno_id, turma_id),
FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
FOREIGN KEY (turma_id) REFERENCES Turma(id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `subconsultas`.`Nota`(
id INT NOT NULL,
aluno_id INT,
turma_id INT,
nota DECIMAL(4,2),
PRIMARY KEY (id),
FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
FOREIGN KEY (turma_id) REFERENCES Turma(id)
) ENGINE = InnoDB;

INSERT INTO Aluno VALUES (1, 'João Paulo Pimentel', 'jpapim@gmail.com', '1978-02-19');
INSERT INTO Aluno VALUES (2, 'José Paulo Pimentel', 'jose@gmail.com', '1988-07-12');
INSERT INTO Aluno VALUES (3, 'Anibal da Silva', 'anibal@gmail.com', '1968-12-14');
INSERT INTO Aluno VALUES (4, 'Maria da Silva', 'maria@gmail.com', '1978-09-09');

INSERT INTO Turma VALUES (1, '2019-03-01', '2019-07-15', 'Turma de Banco de Dados I');
INSERT INTO Turma VALUES (2, '2019-04-01', '2019-07-22', 'Turma de Banco de Dados II');

INSERT INTO AlunoTurma VALUES (1, 1);
INSERT INTO AlunoTurma VALUES (2, 1);
INSERT INTO AlunoTurma VALUES (3, 2);

INSERT INTO Nota VALUES (1, 1, 1, 10);
INSERT INTO Nota VALUES (2, 2, 2, 8);
INSERT INTO Nota VALUES (3, 3, 2, 5);
INSERT INTO Nota VALUES (4, 4, 1, 9);


-- SCHEMA EXE AULA 3
CREATE SCHEMA IF NOT EXISTS `ExeAula3` DEFAULT CHARACTER SET utf8;
USE `ExeAula3`;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`projetos`(
`id` INT NOT NULL,
`titulo` VARCHAR(45) NOT NULL,
`data` DATE NOT NULL,
`url` VARCHAR(100) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`usuario`(
`id` INT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
`email` VARCHAR(45) NOT NULL,
`senha` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`comentario`(
`id` INT NOT NULL,
`comentario` TEXT NOT NULL,
`data` DATE NOT NULL,
`id_usuario` INT,
`id_projeto` INT,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_usuario`) REFERENCES usuario(`id`),
FOREIGN KEY (`id_projeto`) REFERENCES projetos(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`likes_por_projeto`(
`id_projeto` INT NOT NULL,
`id_usuario` INT NOT NULL,
PRIMARY KEY (`id_projeto`, `id_usuario`),
FOREIGN KEY (`id_projeto`) REFERENCES projetos(`id`),
FOREIGN KEY (`id_usuario`) REFERENCES usuario(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ExeAula3`.`likes_por_comentario`(
`id_usuario` INT NOT NULL,
`id_comentario` INT NOT NULL,
PRIMARY KEY (`id_usuario`, `id_comentario`),
FOREIGN KEY (`id_usuario`) REFERENCES usuario(`id`),
FOREIGN KEY (`id_comentario`) REFERENCES comentario(`id`)
) ENGINE = InnoDB;

INSERT INTO `projetos` VALUES (1, 'Aplicação C#', '2018-04-01', 'www.aplicacaocsharp.com.br');
INSERT INTO `projetos` VALUES (2, 'Aplicação Ionic', '2018-05-07', 'www.aplicacaoionic.com.br');
INSERT INTO `projetos` VALUES (3, 'Aplicação Python', '2018-08-05', 'www.aplicacaopython.com.br');

INSERT INTO `usuario` VALUES (1, 'Bruna Luiza', 'bruninha@gmail.com', 'abc123.');
INSERT INTO `usuario` VALUES (2, 'Thiago Braga', 'thiagobraga_1@hotmail.com', 'pena093');
INSERT INTO `usuario` VALUES (3, 'Osvaldo Justino', 'osvaltino@yahoo.com.br', 'osvaldit1_s');
INSERT INTO `usuario` VALUES (4, 'Gabriel Fernando', 'gabriel_fnd@gmail.com', 'gabss34');

INSERT INTO `comentario` VALUES (1, 'A microsoft acertou com essa linguagem!', '2018-05-01', 1, 1);
INSERT INTO `comentario` VALUES (2, 'Parabéns pelo projeto, bem legal!', '2018-12-01', 3, 1);
INSERT INTO `comentario` VALUES (3, 'Super interessante! Fácil e rapido!', '2018-08-09', 4, 2);
INSERT INTO `comentario` VALUES (4, 'Cara, que simples fazer um APP assim!', '2018-01-01', 1, 2);
INSERT INTO `comentario` VALUES (5, 'Linguagem muito diferente.', '2018-11-01', 3, 3);
INSERT INTO `comentario` VALUES (6, 'Adorei aprender Python! Parabéns!', '2019-05-01', 2, 3);
INSERT INTO `comentario` VALUES (7, 'Muito maneiro esse framework!', '2018-04-05', 2, 2);

INSERT INTO `likes_por_projeto` VALUES (1, 1);
INSERT INTO `likes_por_projeto` VALUES (1, 3);
INSERT INTO `likes_por_projeto` VALUES (2, 1);
INSERT INTO `likes_por_projeto` VALUES (2, 2);
INSERT INTO `likes_por_projeto` VALUES (2, 3);
INSERT INTO `likes_por_projeto` VALUES (2, 4);
INSERT INTO `likes_por_projeto` VALUES (3, 2);

INSERT INTO `likes_por_comentario` VALUES (1, 7);
INSERT INTO `likes_por_comentario` VALUES (2, 7);
INSERT INTO `likes_por_comentario` VALUES (4, 7);
-- ==========================================
-- ESTRUTURA DA AULA (Tabelas Iniciais)
-- ==========================================
DROP DATABASE IF EXISTS `bd_aula_triggers`;
CREATE SCHEMA IF NOT EXISTS `bd_aula_triggers` DEFAULT CHARACTER SET utf8;
USE `bd_aula_triggers`;

CREATE TABLE IF NOT EXISTS `bd_aula_triggers`.`Aluno`(
  `cod` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `curso` INT NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY(cod)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bd_aula_triggers`.`Curso`(
  `cod` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(200) NOT NULL,
  PRIMARY KEY(cod)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bd_aula_triggers`.`Matricula`(
  `cod` INT NOT NULL AUTO_INCREMENT,
  `aluno_cod` INT NOT NULL,
  `curso_cod` INT NOT NULL,
  PRIMARY KEY(cod)
) ENGINE = InnoDB;

-- Inserção de Cursos da aula
INSERT INTO `Curso` VALUES (NULL, 'CIÊNCIAS DA COMPUTAÇÃO');
INSERT INTO `Curso` VALUES (NULL, 'TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS');
INSERT INTO `Curso` VALUES (NULL, 'ENGENHARIA DA COMPUTAÇÃO');
INSERT INTO `Curso` VALUES (NULL, 'SISTEMAS DE INFORMAÇÃO');

-- Trigger de Matrícula (Exemplo da Aula)
DELIMITER $$
CREATE TRIGGER tg_matricula
AFTER INSERT ON Aluno
FOR EACH ROW BEGIN
  INSERT INTO Matricula VALUES (NULL, NEW.cod, NEW.curso);
END$$
DELIMITER ;

-- Inserção de Alunos para testar a trigger tg_matricula
INSERT INTO `Aluno` VALUES (NULL, 'João Paulo Pimentel', 2, 1);
INSERT INTO `Aluno` VALUES (NULL, 'José da Silva', 4, 1);

-- Auditoria de Alunos (Exemplo da Aula)
CREATE TABLE IF NOT EXISTS `bd_aula_triggers`.`Alunos_Auditoria`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `cod` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `modificado_em` DATETIME DEFAULT NULL,
  `acao` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY(id)
) ENGINE = InnoDB;

DELIMITER $$
CREATE TRIGGER antesDeUpdate_Alunos
BEFORE UPDATE ON Aluno
FOR EACH ROW
BEGIN
  INSERT INTO Alunos_Auditoria
  SET acao = 'update',
      cod = OLD.cod,
      nome = OLD.nome,
      modificado_em = NOW();
END$$
DELIMITER ;


-- ==========================================
-- SOLUÇÃO DO EXERCÍCIO 2
-- ==========================================

-- 1. Criação da tabela Cursos_Auditoria
CREATE TABLE IF NOT EXISTS `bd_aula_triggers`.`Cursos_Auditoria`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `cod` INT NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `modificado_em` DATETIME DEFAULT NULL,
  `acao` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY(id)
) ENGINE = InnoDB;

-- 2. Criação da Trigger para auditar as alterações (UPDATE) na tabela Curso
DELIMITER $$
CREATE TRIGGER antesDeUpdate_Cursos
BEFORE UPDATE ON Curso
FOR EACH ROW
BEGIN
  INSERT INTO Cursos_Auditoria
  SET acao = 'update',
      cod = OLD.cod,
      descricao = OLD.descricao,
      modificado_em = NOW();
END$$
DELIMITER ;

-- 3. Query para testar a Trigger do Exercício 2
-- (Isso vai disparar a trigger e salvar 'CIÊNCIAS DA COMPUTAÇÃO' na tabela de auditoria)
UPDATE Curso SET descricao = 'CIÊNCIA DA COMPUTAÇÃO' WHERE cod = 1;
