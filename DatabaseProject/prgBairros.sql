CREATE PROCEDURE spInsertBairro
	@Id				INT, 
	@Descricao		VARCHAR(50),
	@Latitude		FLOAT,
	@Longitude		FLOAT
AS
BEGIN
	INSERT INTO tbBairros(Id, Descricao, Latitude, Longitude)
				  VALUES (@Id, @Descricao, @Latitude, @Longitude)

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateBairro
	@Id				INT, 
	@Descricao		VARCHAR(50),
	@Latitude		FLOAT,
	@Longitude		FLOAT
AS
BEGIN
	UPDATE tbBairros
	SET Descricao = @Descricao,
		Latitude = @Latitude,
		Longitude = @Longitude
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteBairro
	@Id				INT
AS
BEGIN
	DELETE tbBairros
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectBairro
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbBairros
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListBairro
AS
BEGIN
	SELECT * 
	FROM tbBairros
END
GO