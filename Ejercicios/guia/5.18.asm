
	ORG 0010
prim		equ	0000
ulti		equ	0008

DATO		rmb	1
posicion	rmb	2
REP		rmb	1	;SI REP=0 LO ENCONTRO UNA SOLA VEZ. SI REP=FF NO LO ENCONTRO. REP=(CANTIDAD DE VECES REPETIDAS)

	org	prim
vector		rmb	ulti



	ORG $8000
inicio	CLR	REP		
	LDAA	DATO		
	LDX	#prim
SIGUE	CMPA	0,X		;comparo a con el vector[0].. y despues con los consecutivos.
	BEQ	es_prim		;si es igual salto para contar y guardar la direccion si es el primero.
vuelve	INX	
	CPX	#ulti		;para saber si llege al final del vector.
	BLO	SIGUE
	
	ldab	rep		
	CMPB	#0
	BEQ	NO_ENCON	;SI NO ENCUENTRA NADA, PONGO LA POSI Y REPETICION EN FF.
	DEC	REP
FIN	BRA	FIN
	
es_prim	ldab	rep		;si es el primero guarda la direccion de memoria.. sino solo incrementa el contador
	CMPB	#0		;COMPARA B CON EL VALOR CERO.
	BNE	CONTAR
	STX	posicion
CONTAR	INC 	REP
	BRA 	vuelve

NO_ENCON LDX	#$FFFF
	 STX	posicion
 	 LDAA	#$FF
	 STAA	rep
	 BRA	FIN

	ORG	prim
	db	$10,$50,$F1,$78,%11110101,$f1,$F1,$98
	
	ORG	DATO
	db	$f1

	ORG $fffe
	dw inicio
