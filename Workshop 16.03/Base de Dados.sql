CREATE DATABASE escola_idiomas;
USE escola_idiomas;

CREATE TABLE curso (
    idDoCurso INT PRIMARY KEY AUTO_INCREMENT,
    idioma VARCHAR(50) NOT NULL
);

CREATE TABLE professor (
    id_Professor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL
);


CREATE TABLE aluno (
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    DataNasc DATE,
    Sexo CHAR(1)
);


CREATE TABLE turma (
    idTurma INT PRIMARY KEY AUTO_INCREMENT,
    id_Professor INT,
    id_Curso INT,
    PeriodoDaTurma VARCHAR(20),
    CONSTRAINT fk_turma_prof FOREIGN KEY (id_Professor) REFERENCES professor(id_Professor),
    CONSTRAINT fk_turma_curso FOREIGN KEY (id_Curso) REFERENCES curso(idDoCurso)
);


CREATE TABLE matricula (
    idMatricula INT PRIMARY KEY AUTO_INCREMENT,
    id_Aluno INT,
    id_Turma INT,
    Status VARCHAR(20),
    PeriodoAluno VARCHAR(20),
    CONSTRAINT fk_matr_aluno FOREIGN KEY (id_Aluno) REFERENCES aluno(idAluno),
    CONSTRAINT fk_matr_turma FOREIGN KEY (id_Turma) REFERENCES turma(idTurma)
);