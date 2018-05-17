	ORG $0000	;INICIO
X	RMB	1	;CREO MASCARA N3 con 8 bits
	CLR	X	;Limpio N3
	LDAA	X	;Cargo datos en A de la primer pos X
	INCA		;Incremento un bit 0X1
	ROLA		;Corro los bits para que aparesca el dos 0X10
	INCA		;Incremento un bit para que aparesca el tres 0X11
FIN	BRA	FIN	;Dejo el loop para ver el estado de memoria
;00 7f 00 00 96 00 4c 49 4c 20 fe fe fe 20 fe