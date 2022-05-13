CREATE TABLE tbLogErroDispositivo (
	Id				INT				PRIMARY KEY,
	DataGeracao		DATETIME		NOT NULL,
	Mensagem		VARCHAR(1000)	NOT NULL,
	Exception		VARCHAR(1000)	NOT NULL
)