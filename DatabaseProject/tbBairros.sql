CREATE TABLE tbBairros (
	Id				INT				PRIMARY KEY,
	Descricao		VARCHAR(50)		NOT NULL,
	Latitude		FLOAT			NOT NULL,
	Longitude		FLOAT			NOT NULL,
	CEP				VARCHAR(20)		NOT NULL
)