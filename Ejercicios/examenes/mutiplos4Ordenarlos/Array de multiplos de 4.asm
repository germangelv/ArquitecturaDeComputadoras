	ORG	$0000
VEC	RMB	2
VECFIN	RMB	2
VEC4	RMB	2
VEC4FIN	RMB	2
CANT	RMB	1
CANT_2	RMB	1

	ORG	$C000	;Inicio de programa
	CLR	CANT	;Limpio CANT
	CLR	CANT_2	;Limpio CANT_2
	LDX	VEC	;Cargo VEC
	LDY	VEC4	;Cargo VEC de multiplo de 4
BUCLE	LDAA	0,X	;Cargo en A VEC 0 y asi...
	RORA		;Paso Bit bajo a Carry
	BCS	NOMUL	;Si es no multiplo salto
	RORA		;Paso Bit bajo a Carry
	BCS	NOMUL	;Si es no multiplo salto
	ROLA		;Como es multiplo recupero
	ROLA		;el numero
	STAA	0,Y	;Guardo multiplo en VEC4
	INY		;Incremento VEC4
	INC	CANT	;Incremento CANT de elementos
NOMUL	INX		;Incremento VEC
	CPX	VECFIN	;Comparo si es ultimo elemento
	BLS	BUCLE	;Salto si es el ultimo
	STY	VEC4FIN	;Guardo direccion de fin de array multiplo de 4	
	DEC	CANT	;Decremento CANT para buscar hasta N-1 vez N elementos
RESET	LDX	VEC4	;Comienzo ordenamiento
	LDY	VEC4	;Cargo en X dir inicial 
	INY		;Cargo en Y dir siguiente
	INC	CANT_2
COMPARA	LDAA	0,X	;Cargo dato en A
	LDAB	0,Y	;Cargo dato en B
	CBA		;Comparo
	BLO	B_ORD	;En el caso que sea menor lo reordeno
	STAA	0,Y	;A hacia B
	STAB	0,X	;B hacia A
B_ORD	INX		;Incremento X
	INY		;Incremento Y
	CPX	VEC4FIN	;Comparo si llego al final
	BNE	COMPARA	;Si X es igual al final del vector NO VUELVE
	LDAA	CANT_2	:Cargo la cantidad de veces que lo hice
	CMPA	CANT	;LLEGO AL MAX?
	BNE	RESET	;Salto al principio para comparar N veces N-1 datos
FIN	BRA	FIN	;Bucle de Fin