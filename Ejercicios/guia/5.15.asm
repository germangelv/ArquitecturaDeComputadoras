;5.15
	ORG $0000
NUM		rmb	1
centenas	rmb	1
decenas		rmb	1
unidades	rmb	1


	ORG $8000
inicio	CLR 	centenas
	CLR	unidades
	CLR 	decenas
	LDAA	NUM
	CMPA	#100
	BLO	SIGUE
CONTI	suba	#100
	inc	centenas
	CMPA	#100
	BHS	CONTI

SIGUE	CMPA	#10
	BLO	SIGUE2
CONTI2	SUBA	#10
	INC	decenas
	CMPA	#10
	BHS	CONTI2

SIGUE2	STAA	unidades
FIN	BRA 	FIN	
	

	
	ORG	num
	db %10111011

	ORG $fffe
	dw inicio
