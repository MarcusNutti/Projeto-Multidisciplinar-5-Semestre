CREATE PROCEDURE spInsertLogDispositivo
	@Id				INT, 
	@Mensagem		VARCHAR(1000)
AS
BEGIN
	INSERT INTO tbLogDispositivo(Id, Mensagem, DataGeracao)
						 VALUES (@Id, @Mensagem, GETDATE())

	RETURN 0
END
GO

-- Não se faz update de Log

CREATE PROCEDURE spDeleteLogDispositivo
	@Id				INT
AS
BEGIN
	DELETE tbLogDispositivo
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectLogDispositivo
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbLogDispositivo
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListLogDispositivo
AS
BEGIN
	SELECT * 
	FROM tbLogDispositivo
END
GO