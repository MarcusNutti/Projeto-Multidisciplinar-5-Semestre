CREATE TABLE tbMedicao (
	DispositivoId	INT,
	DataMedicao		DATETIME,
	ValorChuva		FLOAT			NULL,
	ValorNivel		FLOAT			NULL,
	PRIMARY KEY (DispositivoId, DataMedicao)
)