	ORG $0000
s	rmb	2
n1	rmb	1
n2	rmb	1
n3	rmb	1
n4	rmb	1
n5	rmb	1
n6	rmb	1
n7	rmb	1
nn	rmb	1


;tengo los datos de n1, nn y s.
	
	ORG $8000
inicio	

	CLR 	s
	CLR 	s+1
	CLRA
	CLRB

	LDX	#n1	;CARGA EN X, LA DIRECCION DE N1-
SUMA	LDAB	0,X	; CARGA EN B EL PRIMER VALOR.
	CLRA
	addd 	s	;SUMA D CON S(16 BIT)
	STAA	s	;GUARDA PARTE ALTA
	STAB	s+1	;GUARDA PARTE BAJA
	CPX	#nn	;COMPARA SI LA DIRECCION DE X, ES IGUAL A LA DIRECCION DE NN.
	BEQ	FIN	
	INX
	BRA	SUMA
FIN	BRA 	FIN





	ORG s
	db $00,$00,20,15,4,126,56,12,80,10

	ORG $fffe
	dw inicio
