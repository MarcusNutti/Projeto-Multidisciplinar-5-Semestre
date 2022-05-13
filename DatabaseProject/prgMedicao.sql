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
END
GO