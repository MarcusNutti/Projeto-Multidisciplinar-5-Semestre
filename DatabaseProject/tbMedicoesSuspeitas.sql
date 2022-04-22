CREATE TABLE tbMedicoesSuspeitas (
	DispositivoId	INT,
	DataMedicao		DATETIME,
	ValorChuva		FLOAT			NULL,
	ValorNivel		FLOAT			NULL,
	Detalhes		VARCHAR(300)	NULL,
	PRIMARY KEY (DispositivoId, DataMedicao)
)