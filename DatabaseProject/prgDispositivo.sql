CREATE PROCEDURE spInsertDispositivos
	@Id					INT,
	@Descricao			VARCHAR(100),
	@BairroId			INT,
	@DataAtualizacao	DATETIME,
	@MedicaoReferencia	FLOAT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbBairros WHERE Id = @BairroId)
		RAISERROR ( 'O bairro informado não existe.', 16, 1)

	INSERT INTO tbDispositivos (Id, Descricao, BairroID, DataAtualizacao, MedicaoReferencia)
						VALUES (@Id, @Descricao, @BairroId, @DataAtualizacao, @MedicaoReferencia)

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateDispositivos
	@Id					INT,
	@Descricao			VARCHAR(100),
	@BairroId			INT,
	@DataAtualizacao	DATETIME,
	@MedicaoReferencia	FLOAT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbBairros WHERE Id = @BairroId)
		RAISERROR ( 'O bairro informado não existe.', 16, 1)

	UPDATE tbDispositivos
	SET BairroID = @BairroId,
		Descricao = @Descricao,
		DataAtualizacao = @DataAtualizacao,
		MedicaoReferencia = @MedicaoReferencia
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
GO

CREATE PROCEDURE spSelecionaDispositivosComBairro
AS
BEGIN
	SELECT * FROM fncSelecionaDispositivosComBairro()
END
GO

CREATE PROCEDURE spSearchDispositivos
(
	@Id					VARCHAR(MAX), 
	@Descricao			VARCHAR(50),
	@NomeBairro			VARCHAR(20)
)
AS
BEGIN
	SELECT *
	FROM fncSelecionaDispositivosComBairro()
	WHERE Id LIKE CONCAT('%', ISNULL(@Id, ''), '%') AND
		  Descricao LIKE CONCAT('%', ISNULL(@Descricao, ''), '%') AND
		  NomeBairro LIKE CONCAT('%', ISNULL(@NomeBairro, ''), '%') 
END
GO