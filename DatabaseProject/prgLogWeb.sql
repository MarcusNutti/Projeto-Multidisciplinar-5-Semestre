CREATE PROCEDURE spInsertLogWeb
	@Id				INT, 
	@Mensagem		VARCHAR(1000),
	@Callstack		VARCHAR(1000),
	@TipoOperacao	INT,
	@Detalhes		VARCHAR(1000)
AS
BEGIN
	INSERT INTO tbLogWeb(Id, Mensagem, Callstack, TipoOperacao, Detalhes)
				 VALUES (@Id, @Mensagem, @Callstack, @TipoOperacao, @Detalhes)

	RETURN 0
END
GO

-- Não se faz update de Log

CREATE PROCEDURE spDeleteLogWeb
	@Id				INT
AS
BEGIN
	DELETE tbLogWeb
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectLogWeb
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbLogWeb
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListLogWeb
AS
BEGIN
	SELECT * 
	FROM tbLogWeb
END
GO