CREATE PROCEDURE spInsertSubscriber
	@Id				INT, 
	@BairroId		INT,
	@Telefone		VARCHAR(100),
	@Email			VARCHAR(200),
	@FormaDeAlerta	INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbBairros WHERE Id = @BairroId)
		RAISERROR ( 'O bairro informado não existe.', 16, 1)

	INSERT INTO tbSubscriberAlerta (Id, BairroId, Telefone, Email, FormaDeAlerta)
						    VALUES (@Id, @BairroId, @Telefone, @Email, @FormaDeAlerta)

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateSubscriber
	@Id				INT, 
	@BairroId		INT,
	@Telefone		VARCHAR(100),
	@Email			VARCHAR(200),
	@FormaDeAlerta	INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbBairros WHERE Id = @BairroId)
		RAISERROR ( 'O bairro informado não existe.', 16, 1)

	UPDATE tbSubscriberAlerta
	SET BairroId = @BairroId,
		Telefone = @Telefone,
		Email = @Email,
		FormaDeAlerta = @FormaDeAlerta
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteSubscriber
	@Id				INT
AS
BEGIN
	DELETE tbSubscriberAlerta
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectSubscriber
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbSubscriberAlerta
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListSubscriber
AS
BEGIN
	SELECT * 
	FROM tbSubscriberAlerta
END
GO