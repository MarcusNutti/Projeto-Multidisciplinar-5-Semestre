CREATE PROCEDURE spInsertLogErroDispositivo
	@Id				INT, 
	@Mensagem		VARCHAR(1000),
	@Exception		VARCHAR(1000)
AS
BEGIN
	INSERT INTO tbLogErroDispositivo(Id, Mensagem, Exception, DataGeracao)
						     VALUES (@Id, @Mensagem, @Exception, GETDATE())

	RETURN 0
END
GO

-- Não se faz update de Log

CREATE PROCEDURE spDeleteLogErroDispositivo
	@Id				INT
AS
BEGIN
	DELETE tbLogErroDispositivo
	WHERE Id = @Id
	
	RETURN 0
END
GO

CREATE PROCEDURE spSelectLogErroDispositivo
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbLogErroDispositivo
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListLogErroDispositivo
AS
BEGIN
	SELECT * 
	FROM tbLogErroDispositivo
END
GO