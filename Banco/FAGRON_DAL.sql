--**********************************************************************************
CREATE DATABASE FAGRON_DB
GO
--**********************************************************************************
USE FAGRON_DB
GO
--**********************************************************************************
CREATE TABLE CLIENTE(
ClienteId		INT IDENTITY(1,1) PRIMARY KEY,
Nome			VARCHAR(50),
Sobrenome		VARCHAR(50),
DataNascimento	DATETIME,
Idade			INT,
Profissao		VARCHAR(50)
)
GO
--**********************************************************************************
Create procedure spAddCliente         
(        
    @Nome			VARCHAR(50),         
    @Sobrenome		VARCHAR(50),        
    @DataNascimento DATETIME,        
    @Idade			INT,
	@Profissao		VARCHAR(50)
)        
as         
Begin         
    Insert into Cliente (Nome,Sobrenome,DataNascimento, Idade, Profissao)         
    Values (@Nome,@Sobrenome,@DataNascimento, @Idade, @Profissao)         
End  
GO
--**********************************************************************************
Create procedure spUpdateCliente        
(        
   @ClienteId		INTEGER ,      
   @Nome			VARCHAR(50),       
   @Sobrenome		VARCHAR(50),      
   @DataNascimento	DATETIME,
   @Idade			INT,
   @Profissao		VARCHAR(50)
)        
as        
begin        
   Update Cliente         
   set 
	Nome			= @Nome,        
	Sobrenome		= @Sobrenome,        
	DataNascimento	= @DataNascimento,      
	Idade			= @Idade,
	Profissao       = @Profissao     
   where ClienteId = @ClienteId        
End  
GO
--**********************************************************************************
Create procedure spDeleteCliente       
(        
   @ClienteId int        
)        
as         
begin        
   Delete from Cliente where ClienteId = @ClienteId        
End  
GO
--**********************************************************************************
alter procedure spGetAllClientes      
as      
Begin      
    select 
		ClienteId,
		Nome,
		Sobrenome,
		CONVERT(CHAR,DataNascimento , 103) as DataNascimento ,
		Idade,
		Profissao
      from Cliente   
     order by ClienteId      
End  
GO
--**********************************************************************************


/*
--SELECT @@VERSION
SELECT 'INSERT INTO CLIENTE (CLIENTEID, NOME, SOBRENOME, DATANASCIMENTO, IDADE, PROFISSAO) VALUES (' 
+ CONVERT(VARCHAR, CLIENTEID) + ', '''+NOME+'''' + ', '''+SOBRENOME+'''' + ', '''+CAST(YEAR(DATANASCIMENTO) AS VARCHAR(4)) + '-' + RIGHT('00' +CAST(MONTH(DATANASCIMENTO) AS VARCHAR(2)),2) + '-' + RIGHT('00'+CAST(DAY(DATANASCIMENTO) AS VARCHAR(2)),2)+''''+ ', '''+CONVERT(VARCHAR,IDADE)+''''+ ', '''+PROFISSAO+'''' +')' 
  FROM CLIENTE
*/
--Carga Inicial
INSERT INTO CLIENTE (CLIENTEID, NOME, SOBRENOME, DATANASCIMENTO, IDADE, PROFISSAO) VALUES (10, 'Kaius', 'Reis do Amaral', '1999-01-06', '19', 'Porteiro(a)')
INSERT INTO CLIENTE (CLIENTEID, NOME, SOBRENOME, DATANASCIMENTO, IDADE, PROFISSAO) VALUES (11, 'José Igor', 'Teixeira', '1980-03-22', '37', 'Programador(a)')
INSERT INTO CLIENTE (CLIENTEID, NOME, SOBRENOME, DATANASCIMENTO, IDADE, PROFISSAO) VALUES (12, 'Luciana das Neves', 'Teixeira', '1979-12-14', '30', 'Fisioterapêuta')