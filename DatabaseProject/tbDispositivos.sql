CREATE TABLE tbDispositivos (
	Id					INT				PRIMARY KEY,
	Descricao			VARCHAR(100)	NULL,
	BairroID			INT
						CONSTRAINT FK_Bairro_Dispositivo 
							FOREIGN KEY REFERENCES tbBairros NOT NULL,
	DataCriacao			DATETIME		NOT NULL,
	MedicaoReferencia	FLOAT			NOT NULL
)