	ORG	$0000
dirini	RMB	2
cant	RMB	1
max	RMB	1
	ORG	$C000
	CLR	max
	LDX	dirini
inicio	LDAA	0,X
	CMPA	max
	BLO	nomayor
	STAA	max
nomayor	INX
	DEC	cant
	BNE	inicio
fin	BRA	fin
