create database datasurgery1;
use datasurgery1;

create table sala(
id INT  auto_increment PRIMARY KEY,
identificacao_sala varchar (150));


create table paciente (
id INT auto_increment primary key,
nome VARCHAR  (150) not null,
CPF VARCHAR (25) not null,
endereco VARCHAR (150));

create table especialidade(
id INT auto_increment primary key,
especialidade VARCHAR(150));


create table medico(
id INT auto_increment primary key,
nome VARCHAR (150) not null,
especialista VARCHAR(150),
nascimento VARCHAR(150),
CRM VARCHAR (150)not null,
especialidade_id INT not null , 
foreign key (especialidade_id) references especialidade (id));


create table consulta(
id INT auto_increment primary key,
medico_id INT not null, 
paciente_id INT not null,
datahora DATETIME,
foreign key (medico_id) references medico (id),
foreign key (paciente_id) references paciente (id));

create table disponibilidade(
codigo INT  auto_increment primary key,
datahora DATETIME NOT NULL,
MEDICO VARCHAR (150),
consulta_id INT ,
sala_id INT,
foreign key (consulta_id) references consulta(id),
foreign key (sala_id) references sala(id));






INSERT INTO paciente ( nome, CPF, endereco) values ("Karine Macena Porciúncula", "86132473009",
"Rua Flores 10, apto 101");
INSERT INTO paciente ( nome, CPF, endereco) values ("Claudia de Souza", "84532478009",
"Rua josé 10, apto 102");
INSERT INTO paciente ( nome, CPF, endereco) values ("Paulo Silva Cardoso", "981328790009",
"quadra 55 lote 07 apt 384");
INSERT INTO paciente ( nome, CPF, endereco) values ("Joao Alves Ferreira", "008961237009",
"Rua Sao José, casa 21 MG");
INSERT INTO paciente ( nome, CPF, endereco) values ("Yuri Pinto", "008912347009",
"Quadra 50, casa 9 df");
select * from paciente;


INSERT INTO medico ( nome, especialista, nascimento, CRM) values ("Anny Quintanilha ", "cardiologista",
"21-08-1989", "120935");
INSERT INTO medico ( nome, especialista, nascimento, CRM) values ("José Moura ", "pediaria",
"21-08-1989", "120935");
INSERT INTO medico ( nome, especialista, nascimento, CRM) values ("Livia Souza ", "reumatologia",
"21-08-1989", "120935");
INSERT INTO medico ( nome, especialista, nascimento, CRM) values ("Lívia Veloso ", "neurologista",
"17-09-1993", "168935");
INSERT INTO medico ( nome, especialista, nascimento, CRM) values ("Cristovão Xavier", "ortopedista",
"10-10-1990", "469335");

INSERT INTO consulta (medico_id, paciente_id, datahora) values ( 1 , 4, "2020-03-05 15:00");
INSERT INTO consulta (medico_id, paciente_id, datahora) values ( 2 , 2, "2019-02-03 11:00");
INSERT INTO consulta (medico_id, paciente_id, datahora) values ( 3 , 3, "2020-10-05 16:00");
INSERT INTO consulta (medico_id, paciente_id, datahora) values ( 4 , 1, "2020-08-18 18:00");
INSERT INTO consulta (medico_id, paciente_id, datahora) values ( 5 , 5, "2021-01-20 20:00");

INSERT INTO sala (identificacao_sala) VALUES ( "sala_25" );
INSERT INTO sala (identificacao_sala) VALUES ( "sala_26");
INSERT INTO sala (identificacao_sala) VALUES ( "sala_27");
INSERT INTO sala (identificacao_sala) VALUES ( "sala_15");
INSERT INTO sala (identificacao_sala) VALUES ( "sala_10");

INSERT INTO disponibilidade (datahora, medico, consulta_id, sala_id) values ("2021-01-20 20:00",
 3 , 4 , 1 );
INSERT INTO disponibilidade (datahora, medico, consulta_id, sala_id) values ("2020-03-19 16:00",
 2 , 5 , 4);
 INSERT INTO disponibilidade (datahora, medico, consulta_id, sala_id) values ("2020-03-20 14:00",
 5 , 3 , 5 );
 INSERT INTO disponibilidade (datahora, medico, consulta_id, sala_id) values ("2021-01-20 20:00",
 1 , 1 , 3);
 INSERT INTO disponibilidade (datahora, medico, consulta_id, sala_id) values ("2021-01-20 20:00",
 4 , 2 , 2 );
 

