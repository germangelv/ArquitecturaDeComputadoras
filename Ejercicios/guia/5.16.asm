;5.16
	ORG $0000
NUM		rmb	1
SIMBOLO		rmb	1

	ORG $8000
inicio	LDAA	NUM
	CMPA	#128
	BHS	MAY_SAM
	LDAB	#'<'
	BRA	GETOUT
	
MAY_SAM	CMPA #128
	BHI	MAYOR	
	LDAB	#'='
	BRA 	GETOUT
	
MAYOR	LDAB	#'>'

GETOUT	STAB	SIMBOLO
FIN	BRA 	FIN
	
	ORG	NUM
	db	130
	ORG $fffe
	dw inicio
