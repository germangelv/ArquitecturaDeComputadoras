	ORG $0000
P	RMB	2
Q	RMB	2
S	RMB	3


	ORG $8000
inicio	CLC		;PONGO EN CERO EL BIT DE CARRY
	CLR S
	CLR S+1
	CLR S+2
	CLRA
	CLRB
	LDX	#P
	LDY	#Q
	LDAB	1,X
	ADCB	1,Y		;SUMO CON CARRY PARTE BAJA
	LDAA	0,X
	ADCA	0,Y		;SUMO CON CARRY PARTE ALTA
	STAB	S+2		;GUARDO LA PARTE BAJA
	STAA	S+1		;GUARDO LA PARTE MEDIANA
	BCC	FIN
	INC	S		;SI HAY CARRY INCREMENTO EL TERCER BYTE DE RESULTADO.
FIN	BRA	FIN	

	


	ORG P
	dw 56000,14024


	ORG $fffe
	dw inicio
