CREATE PROCEDURE spInsertUsuario
	@UsuarioLogin	VARCHAR(64), 
	@Senha			VARCHAR(64),
	@Id				INT,
	@Nome			VARCHAR(100)
AS
BEGIN
	INSERT INTO tbUsuario(UsuarioLogin, Senha, Nome)
				  VALUES (@UsuarioLogin, @Senha, @Nome)

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateUsuario
	@UsuarioLogin	VARCHAR(64),
	@Senha			VARCHAR(64),
	@Id				INT,
	@Nome			VARCHAR(100)
AS
BEGIN
	UPDATE tbUsuario
	SET UsuarioLogin = @UsuarioLogin,
		Senha = @Senha,
		Nome = @Nome
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spDeleteUsuario
	@Id				INT
AS
BEGIN
	DELETE tbUsuario
	WHERE Id = @Id

	RETURN 0
END
GO

CREATE PROCEDURE spSelectUsuario
	@Id				INT
AS
BEGIN
	SELECT *
	FROM tbUsuario
	WHERE Id = @Id
END
GO

CREATE PROCEDURE spListUsuario
AS
BEGIN
	SELECT *
	FROM tbUsuario
END
GO