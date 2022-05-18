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
	ORDER BY DataMedicao DESC
END
GO

----------------------------------------// Dashboard //----------------------------------------

-- Dispositivos
CREATE FUNCTION fncSelecionaMedicaoUltimoDiaPorDispositivo
(
	@DispositivoId	INT
)
RETURNS TABLE AS
RETURN
(
	SELECT DATEPART(HOUR, dataMedicao) [ParteDataMedicao],
		   AVG(ValorChuva)			   [MediaChuva],
		   AVG(ValorNivel)			   [MediaNivel]
	FROM tbMedicao
	WHERE DispositivoId = @DispositivoId AND
		  DataMedicao >= DATEADD(HOUR, -24, GETDATE())
	GROUP BY DATEPART(HOUR, DataMedicao)
)
GO

CREATE PROCEDURE spSelecionaMedicaoUltimoDiaPorDispositivo
(
	@DispositivoId	INT
)
AS
BEGIN
	SELECT *
	FROM fncSelecionaMedicaoUltimoDiaPorDispositivo(@DispositivoId)
END
GO

CREATE FUNCTION fncSelecionaMedicaoUltimoMesPorDispositivo
(
	@DispositivoId	INT
)
RETURNS TABLE AS
RETURN
(
	SELECT DATEPART(DAY, dataMedicao)  [ParteDataMedicao],
		   AVG(ValorChuva)			   [MediaChuva],
		   AVG(ValorNivel)			   [MediaNivel]
	FROM tbMedicao
	WHERE DispositivoId = @DispositivoId AND
		  DataMedicao >= DATEADD(MONTH, -1, GETDATE())
	GROUP BY DATEPART(DAY, DataMedicao)
)
GO

CREATE PROCEDURE spSelecionaMedicaoUltimoMesPorDispositivo
(
	@DispositivoId	INT
)
AS
BEGIN
	SELECT *
	FROM fncSelecionaMedicaoUltimoMesPorDispositivo(@DispositivoId)
END
GO