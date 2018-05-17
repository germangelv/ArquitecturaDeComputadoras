	ORG $0000
n1	rmb	1
n2	rmb	1
n3	rmb	1
s	rmb	2
n	rmb	1


	ORG $8000
inicio	
	LDAB	n	;cargo el contenido de "n" en b
	CLRA
	XGDY		;CAMBIO D CON IY.
	CLRA
	CLRB
	CLR	s
	CLR	s+1
	ldx	#n1		;cargo el puntero x, para que apunte a n1.(le pongo la direccion de n1)
SUMAR	LDAB	0,X		;CARGO EL PRIMER NUMERO EN B.
	ADDD	s	
	STAA	s		;GUARDO D EN S.
	STAB	s+1
	INX
	DEY			;DECREMENTO LA CANTIDAD DE NUMEROS A SUMAR.PORQUE YA SUME UNO.
	CPY	#0
	BNE	SUMAR
FIN	BRA	FIN
	
	


	ORG n1
	db 12,56,14,0,0,3
	ORG $fffe
	dw inicio
