-- Criacao da base de dados do projeto academyspring
CREATE DATABASE IF NOT EXISTS academyspring DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE academyspring;

-- Tabela Aluno com os novos campos email e nota_enade
CREATE TABLE IF NOT EXISTS Aluno (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    matricula VARCHAR(100) NOT NULL,
    nota_enade DECIMAL(5,2) NULL,
    curso VARCHAR(100) NOT NULL,
    status VARCHAR(100) NOT NULL,
    turno VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Tabela Usuario para login e autenticacao
CREATE TABLE IF NOT EXISTS Usuario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    user VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Insercao de usuarios padrao para teste no sistema
-- Senha de 'julius': 123 (hash md5: 202cb962ac59075b964b07152d234b70)
-- Senha de 'test': 1234 (hash md5: 98f6bcd4621d373cade4e832627b4f6)
INSERT INTO Usuario (id, email, senha, user) VALUES
(1, 'julius@email.com', '202cb962ac59075b964b07152d234b70', 'julius'),
(2, 'test@email.com', '98f6bcd4621d373cade4e832627b4f6', 'test')
ON DUPLICATE KEY UPDATE user=VALUES(user);

-- Insercao de alunos de exemplo com email e nota do ENADE
INSERT INTO Aluno (id, nome, email, matricula, nota_enade, curso, status, turno) VALUES
(1, 'Maria Almeida Pires', 'maria.almeida@exemplo.com', 'ACA202215', 85.50, 'CONTABILIDADE', 'ATIVO', 'MATUTINO'),
(2, 'Matheus Faria', 'matheus.faria@exemplo.com', 'ACA2022805', 72.00, 'INFORMATICA', 'INATIVO', 'MATUTINO'),
(3, 'Matheus Cunha', 'matheus.cunha@exemplo.com', 'ACA2022785', 91.00, 'CONTABILIDADE', 'ATIVO', 'NOTURNO'),
(4, 'Vanessa Martins', 'vanessa.martins@exemplo.com', 'ACA2022365', 88.00, 'DIREITO', 'ATIVO', 'MATUTINO'),
(5, 'Patrick Aquino', 'patrick.aquino@exemplo.com', 'ACA2022715', 65.50, 'INFORMATICA', 'INATIVO', 'NOTURNO'),
(6, 'Wanderson Souza', 'wanderson.souza@exemplo.com', 'ACA2022605', 95.00, 'BIOMEDICINA', 'ATIVO', 'MATUTINO')
ON DUPLICATE KEY UPDATE nome=VALUES(nome);
