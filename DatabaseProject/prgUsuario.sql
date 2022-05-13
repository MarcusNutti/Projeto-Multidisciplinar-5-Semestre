CREATE PROCEDURE spInsertUsuario
	@UsuarioLogin	VARCHAR(64), 
	@Senha			VARCHAR(64),
	@Id				INT,
	@Nome			VARCHAR(100),
	@Imagem			VARBINARY(MAX),
	@TipoUsuario	INT
AS
BEGIN
	INSERT INTO tbUsuario(UsuarioLogin, Senha, Nome, Imagem, TipoUsuario)
				  VALUES (@UsuarioLogin, @Senha, @Nome, @Imagem, @TipoUsuario)

	RETURN 0
END
GO

CREATE PROCEDURE spUpdateUsuario
	@UsuarioLogin	VARCHAR(64),
	@Senha			VARCHAR(64),
	@Id				INT,
	@Nome			VARCHAR(100),
	@Imagem			VARBINARY(MAX),
	@TipoUsuario	INT
AS
BEGIN
	UPDATE tbUsuario
	SET UsuarioLogin = @UsuarioLogin,
		Senha = @Senha,
		Nome = @Nome,
		Imagem = @Imagem,
		TipoUsuario = @TipoUsuario
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

CREATE PROCEDURE spVerificaUsuarioCadastrado
(
	@UsuarioEncriptografado	VARCHAR(64)
)
AS
BEGIN
	IF EXISTS(SELECT * FROM tbUsuario WHERE UsuarioLogin = @UsuarioEncriptografado)
		SELECT 1 AS RETORNO
	ELSE
		SELECT 0 AS RETORNO
END
GO

CREATE PROCEDURE spVerificaUsuarioESenhaCorretos
(
	@UsuarioEncriptografado	VARCHAR(64),
	@SenhaEncriptografada	VARCHAR(64)
)
AS
BEGIN
	IF EXISTS(SELECT * FROM tbUsuario WHERE UsuarioLogin = @UsuarioEncriptografado AND
									        Senha = @SenhaEncriptografada)
		SELECT * FROM tbUsuario WHERE UsuarioLogin = @UsuarioEncriptografado AND
									        Senha = @SenhaEncriptografada
END
GO