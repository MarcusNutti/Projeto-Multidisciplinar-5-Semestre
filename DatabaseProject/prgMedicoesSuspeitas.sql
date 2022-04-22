CREATE PROCEDURE spInsertMedicaoSuspeita
	@DispositivoId	INT, 
	@DataMedicao	DATETIME,
	@ValorChuva		FLOAT,
	@ValorNivel		FLOAT,
	@Detalhes		VARCHAR(300)
AS
BEGIN
	INSERT INTO tbMedicoesSuspeitas (DispositivoId, DataMedicao, ValorChuva, ValorNivel, Detalhes)
							 VALUES (@DispositivoId, @DataMedicao, @ValorChuva, @ValorNivel, @Detalhes)

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteMedicaoSuspeita
	@DispositivoId	INT, 
	@DataMedicao	DATETIME
AS
BEGIN
	DELETE tbMedicoesSuspeitas
	WHERE DispositivoId = @DispositivoId AND
		  DataMedicao = @DataMedicao

	RETURN 0
END
GO

CREATE PROCEDURE spSelectMedicaoSuspeita
	@DispositivoId	INT, 
	@DataMedicao	DATETIME
AS
BEGIN
	SELECT *
	FROM tbMedicoesSuspeitas
	WHERE DispositivoId = @DispositivoId AND
		  DataMedicao = @DataMedicao
END
GO


CREATE PROCEDURE spListMedicaoSuspeita
AS
BEGIN
	SELECT * 
	FROM tbMedicoesSuspeitas
END
GO