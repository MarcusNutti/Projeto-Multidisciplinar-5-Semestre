CREATE TABLE tbDispositivos (
	Id				INT				PRIMARY KEY,
	BairroID		INT
					CONSTRAINT FK_Bairro_Dispositivo 
						FOREIGN KEY REFERENCES tbBairros NOT NULL,
	DataCriacao		DATETIME,
)