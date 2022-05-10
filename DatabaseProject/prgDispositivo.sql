CREATE PROCEDURE spInsertDispositivos
	@Id				INT, 
	@BairroId		INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbBairros WHERE Id = @BairroId)
		RAISERROR ( 'O bairro informado não existe.', 16, 1)

	INSERT INTO tbDispositivos (Id, BairroID, DataCriacao)
						VALUES (@Id, @BairroId, GETDATE())

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateDispositivos
	@Id				INT, 
	@BairroId		INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbBairros WHERE Id = @BairroId)
		RAISERROR ( 'O bairro informado não existe.', 16, 1)

	UPDATE tbDispositivos
	SET BairroID = @BairroId,
		DataCriacao = GETDATE()
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteDispositivos
	@Id				INT
AS
BEGIN
	DELETE tbDispositivos
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectDispositivos
	@Id				INT
AS
BEGIN
	SELECT * 
	FROM tbDispositivos
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListDispositivos
AS
BEGIN
	SELECT * 
	FROM tbDispositivos
END
GO

CREATE FUNCTION fncSelecionaDispositivosComBairro()
RETURNS TABLE AS
RETURN
(
	SELECT d.*,
		   b.Descricao as [NomeBairro]
	FROM tbDispositivos d
	INNER JOIN tbBairros b ON b.Id = d.BairroID 
)