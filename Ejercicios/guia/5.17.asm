;5.17
	ORG $0000
prim	equ	$0000
ulti	equ	$0007
vector		rmb	8
posicion	rmb	1
AUX		RMB	2



	ORG $8000
inicio	ldx	#prim
	ldy	#prim+1
sigue	ldaa	0,X
sigue2	
	cmpa	0,y
	BLO	CAMBIO
	INY
	cpy	#ulti
	bls	sigue2

	xgdx
	SUBD	#prim
	stab	posicion
fin	bra 	fin
	
CAMBIO	STY	AUX
	LDX	AUX
	iny
	bra	sigue



	

	ORG	prim
	db	$10,50,45,78,%11110101,$f1,1,98

	ORG $fffe
	dw inicio




;	ORG	0000
;COMIENZO	EQU	0000
;FINAL		EQU	0020	
;	ORG COMIENZO
;VECTOR	RMB	FINAL; CREO EL VECTOR DESDE EL COMIENZO HASTA EL FINAL...



;	ORG	$8000
;	LDX	#COMIENZO