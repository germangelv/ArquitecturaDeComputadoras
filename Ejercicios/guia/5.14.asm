;5.14
	ORG $0000
num	rmb	1
ascii_h	rmb	1
ascii_l	rmb	1


	ORG $8000
inicio	ldaa	num
	anda	#$0F
	adda	#'0'
	cmpa	#'9'
	BLS	SIGUE
	ADDA	#$7
SIGUE	STAA	ascii_l
	
	ldaa	num
	lsra
	lsra
	lsra
	lsra
	adda	#'0'
	CMPA	#'9'
	BLS	SIGUE2
	adda	#$7

SIGUE2	STAA	ascii_h

fin	bra fin
	
	ORG	num
	db	%10101110

	ORG $fffe
	dw inicio
