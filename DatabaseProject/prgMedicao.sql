CREATE PROCEDURE spInsertMedicao
	@Id				INT,
	@DispositivoId	INT, 
	@DataMedicao	DATETIME,
	@ValorChuva		FLOAT,
	@ValorNivel		FLOAT
AS
BEGIN
	INSERT INTO tbMedicao(DispositivoId, DataMedicao, ValorChuva, ValorNivel)
				  VALUES (@DispositivoId, @DataMedicao, @ValorChuva, @ValorNivel)

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteMedicao
	@Id				INT
AS
BEGIN
	DELETE tbMedicao
	WHERE id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectMedicao
	@Id				INT
AS
BEGIN
	SELECT *
	FROM tbMedicao
	WHERE Id = @Id
END
GO


CREATE PROCEDURE spListMedicao
AS
BEGIN
	SELECT * 
	FROM tbMedicao
	ORDER BY DataMedicao DESC
END
GO

CREATE PROCEDURE spSearchMedicao
(
	@DispositivoId	VARCHAR(MAX), 
	@DataInicial	VARCHAR(MAX),
	@DataFinal		VARCHAR(MAX)
)
AS
BEGIN
	IF @DataInicial = ''
		SET @DataInicial = NULL

	IF @DataFinal = ''
		SET @DataFinal = NULL

	SELECT *
	FROM tbMedicao
	WHERE DispositivoId LIKE CONCAT('%', ISNULL(@DispositivoId, ''), '%') AND
		  DataMedicao > CAST(ISNULL(@DataInicial, '1800-01-1') AS DATETIME) AND
		  DataMedicao < CAST(ISNULL(@DataFinal, '9999-12-31') AS DATETIME)
END
GO