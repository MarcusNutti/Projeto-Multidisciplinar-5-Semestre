CREATE PROCEDURE spInsertBairros
	@Id				INT, 
	@Descricao		VARCHAR(50),
	@CEP			VARCHAR(20),
	@Latitude		FLOAT,
	@Longitude		FLOAT
AS
BEGIN
	INSERT INTO tbBairros(Id, Descricao, Latitude, Longitude, CEP)
				  VALUES (@Id, @Descricao, @Latitude, @Longitude, @CEP)

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateBairros
	@Id				INT, 
	@Descricao		VARCHAR(50),
	@CEP			VARCHAR(20),
	@Latitude		FLOAT,
	@Longitude		FLOAT
AS
BEGIN
	UPDATE tbBairros
	SET Descricao = @Descricao,
		CEP	= @CEP,
		Latitude = @Latitude,
		Longitude = @Longitude
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteBairros
	@Id				INT
AS
BEGIN
	DELETE tbBairros
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectBairros
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbBairros
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListBairros
AS
BEGIN
	SELECT * 
	FROM tbBairros
END
GO