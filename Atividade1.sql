create database bd_consultorio;

create table tbl_pacientes(
id int not null primary key auto_increment,
nome varchar(50) not null,
idade int not null,
sexo char(1) not null,
email varchar (100) not null,
telefone varchar (100) not null,
endereco varchar (100) not null
);

insert into tbl_pacientes(nome, idade, sexo, email, telefone, endereco)
values("Bruno", 19, "M", "brunotrudge@gmail.com", "15998567421", "rua bortoleto alvez 2234"),
("Maria", 12, "F", "mariafranca@gmail.com", "1599874221", "rua demer santos 2594"),
("Alice", 17, "F", "alicespanha@gmail.com", "159945877421", "rua rodolfo miranda 8745"),
("Isabella", 20, "F", "isavassao@gmail.com", "15997451268", "rua nascente troi 5587"),
("Beatriz", 14, "F", "beatrizsalem@gmail.com", "15996861237", "rua wiliiam yared 1000");

select *from tbl_pacientes;

DELIMITER $$
create procedure sp_lista_pacientes2(IN opcao INT) 
begin 

  IF opcao > 18 then
      select *from tbl_pacientes where idade > "18";
  ELSEIF opcao < 18 then
      select *from tbl_pacientes where idade < "18";
  ELSE 
	  select *from tbl_pacientes;
      
   END IF;
END $$
 DELIMITER ;    
 
 show procedure status;
 
 #LISTA maior de idade
 call sp_lista_pacientes2(19);
 #LISTA menor de idade
 call sp_lista_pacientes2(12);
 
 DELIMITER $$