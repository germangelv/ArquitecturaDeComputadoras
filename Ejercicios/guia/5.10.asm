	ORG $0000
N1	RMB	1
N2	RMB	1
N3	RMB	1
MAXIMO	RMB	1

	ORG $8000
inicio	
	LDAA	N1
	CMPA	N2
	BHS	NUM
	LDAA	N2
NUM	CMPA	N3
	BHS	MAYOR
	LDAA	N3
MAYOR	STAA	MAXIMO
FIN	BRA	FIN
	


	
	ORG	N1
	DB %11000111,%10011011,%01010101

	ORG $fffe
	dw inicio
