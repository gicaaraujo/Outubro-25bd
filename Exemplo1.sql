create database bd_clientes;

create table tbl_clientes(
codigo int not null primary key auto_increment,
nome varchar(50) not null,
sexo char(1) not null
);

insert into tbl_clientes(nome, sexo)
values("Bruno Mars", "M"), ("Gigi Hadid", "F"), ("Barbara Palvin", "F");

select *from tbl_clientes;

DELIMITER $$
create procedure sp_lista_clientes(IN opcao INT) 
begin 

  IF opcao = 0 then
      select *from tbl_clientes where sexo = "F";
  ELSEIF opcao = 1 then
      select *from tbl_clientes where sexo = "M";
  ELSE 
	  select *from tbl_clientes;
      
   END IF;
END $$
 DELIMITER ;    
 
 show procedure status;
 
 #LISTA SEXO FEMININO 
 call sp_lista_clientes(0);
 #LISTA SEXO MASCULINO
 call sp_lista_clientes(1);
 #LISTA TODOS
 call sp_lista_clientes(2); 
 
 DELIMITER $$
 
 CREATE PROCEDURE sp_busca_cliente_por_nome2
                      (IN nome_parcial varchar(100))
 begin
     select *from tbl_clientes
     where nome like concat('%', nome_parcial, '%');
end $$

DELIMITER ;

 call sp_busca_cliente_por_nome2('BAR');

