CREATE TABLE tbLogWeb (
	Id				INT				PRIMARY KEY,
	DataGeracao		DATETIME		NOT NULL,
	Mensagem		VARCHAR(1000)	NOT NULL,
	Callstack		VARCHAR(1000)	NULL,
	TipoOperacao	INT				NULL,
	Detalhes		VARCHAR(1000)	NULL
)