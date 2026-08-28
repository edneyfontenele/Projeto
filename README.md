# MySQL no Docker + Spring Boot - Gerenciamento de Alunos

Ambiente completo configurado com **MySQL 8.0**, **phpMyAdmin** e o projeto **Spring Boot (Gerenciamento de Alunos)** com os novos campos **E-mail** e **Nota do ENADE**.

---

## 🔗 Links do Repositório

- **Link do Repositório no GitHub (Aluno):** [https://github.com/edneyfontenele/projeto-](https://github.com/edneyfontenele/projeto-)
- **URL Git para Clonar:** `https://github.com/edneyfontenele/projeto-.git`
- **Repositório Original (Professor):** [https://github.com/profjppimentel/gerenciamento-alunos-crud-springboot-master](https://github.com/profjppimentel/gerenciamento-alunos-crud-springboot-master)

---

## 🚀 Como Executar o Banco de Dados (Docker)

### 1. Iniciar os Containers (MySQL + phpMyAdmin)
- **Opção rápida no Windows:** Dê um duplo-clique no arquivo `iniciar.bat`.
- **Ou via terminal:**
  ```bash
  docker compose up -d
  ```

### 2. Parar os Containers
- **Opção rápida no Windows:** Dê um duplo-clique no arquivo `parar.bat`.
- **Ou via terminal:**
  ```bash
  docker compose down
  ```

---

## 🔑 Credenciais do Banco e Portas

| Serviço | Porta | Usuário Root | Usuário Padrão | Senha Padrão | Banco / Schema |
|---|---|---|---|---|---|
| **MySQL** | `3306` | `root` / `root` | `usuario` | `senha123` | `academyspring` |
| **phpMyAdmin** | `8080` (`http://localhost:8080`) | `root` / `root` | `usuario` | `senha123` | `academyspring` |

---

## ☕ Como Executar a Aplicação Spring Boot

1. **Abrir na IDE (Eclipse / VS Code / IntelliJ):**
   - Importe a pasta [`gerenciamento-alunos-crud-springboot`](file:///c:/Users/edney/Downloads/banco%20de%20dados/gerenciamento-alunos-crud-springboot) como projeto Maven existente.
   - Execute a classe principal [`GerenciamentoAlunosApplication.java`](file:///c:/Users/edney/Downloads/banco%20de%20dados/gerenciamento-alunos-crud-springboot/src/main/java/br/com/gerenciamento/GerenciamentoAlunosApplication.java).

2. **Acessar o Sistema:**
   - URL: [http://localhost:8082](http://localhost:8082)
   - **Login de Teste:** Usuário `julius` com senha `123` (ou usuário `test` com senha `1234`).
   - Você também pode cadastrar novos usuários e gerenciar alunos (inserir, editar, filtrar e excluir).

---

## 📦 Arquivos do Projeto

- **[`gerenciamento-alunos-com-enade-e-email.zip`](file:///c:/Users/edney/Downloads/banco%20de%20dados/gerenciamento-alunos-com-enade-e-email.zip)**: Arquivo compactado com o projeto Spring Boot completo.
- **[`projeto_spring_boot_info.txt`](file:///c:/Users/edney/Downloads/banco%20de%20dados/projeto_spring_boot_info.txt)**: Informações do projeto, resumo de mudanças e link do GitHub em texto simples.
- **[`projeto_spring_boot_info.docx`](file:///c:/Users/edney/Downloads/banco%20de%20dados/projeto_spring_boot_info.docx)**: Documento Word formatado com todas as instruções.
