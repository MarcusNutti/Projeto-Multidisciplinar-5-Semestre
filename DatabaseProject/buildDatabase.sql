IF NOT EXISTS(SELECT * FROM SYS.DATABASES d WHERE d.Name = 'TrabalhoMultidisciplinar')
	CREATE DATABASE TrabalhoMultidisciplinar

GO
USE TrabalhoMultidisciplinar
GO

-- Criação tbBairros
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbBairros')
BEGIN
	IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbDispositivos')
		ALTER TABLE tbDispositivos
			DROP CONSTRAINT FK_Bairro_Dispositivo;

	IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbSubscriberAlerta')
		ALTER TABLE tbSubscriberAlerta
			DROP CONSTRAINT FK_Bairro_Subscriber;

	DROP TABLE tbBairros
END

GO
:r tbBairros.sql
GO

-- Criação tbDispositivo
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbDispositivos')
	DROP TABLE tbDispositivos

GO
:r tbDispositivos.sql
GO

-- Criação tbMedicao
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbMedicao')
	DROP TABLE tbMedicao
	
GO
:r tbMedicao.sql
GO

-- Criação tbUsuario
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbUsuario')
	DROP TABLE tbUsuario
	
GO
:r tbUsuario.sql
GO

-- Criação tbSubscriberAlerta
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbSubscriberAlerta')
	DROP TABLE tbSubscriberAlerta
	
GO
:r tbSubscriberAlerta.sql
GO

-- Criação tbMedicoesSuspeitas
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbMedicoesSuspeitas')
	DROP TABLE tbMedicoesSuspeitas
	
GO
:r tbMedicoesSuspeitas.sql
GO

-- Criação tbLogDispositivo
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbLogDispositivo')
	DROP TABLE tbLogDispositivo
	
GO
:r tbLogDispositivo.sql
GO

-- Criação tbLogErroDispositivo
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbLogErroDispositivo')
	DROP TABLE tbLogErroDispositivo
	
GO
:r tbLogErroDispositivo.sql
GO

-- Criação tbLogWeb
IF EXISTS(SELECT * FROM SYS.TABLES t WHERE t.Name = 'tbLogWeb')
	DROP TABLE tbLogWeb
	
GO
:r tbLogWeb.sql
GO

GO
USE TrabalhoMultidisciplinar
GO

DECLARE @procName VARCHAR(200)

DECLARE proceduresNoSistema CURSOR STATIC FORWARD_ONLY FOR
	SELECT p.name from SYS.PROCEDURES p

OPEN proceduresNoSistema

FETCH NEXT FROM proceduresNoSistema
	INTO @procName

WHILE @@FETCH_STATUS = 0
BEGIN 
	DECLARE @sql VARCHAR(200) = CONCAT('DROP PROCEDURE ', @procName)
	EXEC(@sql)

	FETCH NEXT FROM proceduresNoSistema
		INTO @procName
END

CLOSE proceduresNoSistema
DEALLOCATE proceduresNoSistema

GO

:r prgBairros.sql
:r prgDispositivo.sql
:r prgLogDispositivo.sql
:r prgLogErroDispositivo.sql
:r prgLogWeb.sql
:r prgMedicao.sql
:r prgMedicoesSuspeitas.sql
:r prgSubscriberAlerta.sql
:r prgUsuario.sql