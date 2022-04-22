CREATE PROCEDURE spInsertMedicao
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
	@DispositivoId	INT, 
	@DataMedicao	DATETIME
AS
BEGIN
	DELETE tbMedicao
	WHERE DispositivoId = @DispositivoId AND
		  DataMedicao = @DataMedicao

	RETURN 0
END
GO

CREATE PROCEDURE spSelectMedicao
	@DispositivoId	INT, 
	@DataMedicao	DATETIME
AS
BEGIN
	SELECT *
	FROM tbMedicao
	WHERE DispositivoId = @DispositivoId AND
		  DataMedicao = @DataMedicao
END
GO


CREATE PROCEDURE spListMedicao
AS
BEGIN
	SELECT * 
	FROM tbMedicao
END
GO