	ORG	$0000	
dirIni	RMB	2	;Declaro Dir Inicial Vector
dirFin	RMB	2	;Declaro Dir Final Vector
dirPar	RMB	2	;Declaro Pares
dirImpa	RMB	2	;Declaro Impares
	ORG	$C000	
	LDX	dirIni	;Cargo dir en X
bucle	LDAA	0,X	;Cargo dir de X en A
	RORA		;Corro el bit de impar al Carry
	BCC	espar	;Es carry papu
	ROLA		;Acomodo la guazada
	LDY	dirImpa	;Cargo dir Impares Y
	STAA	0,Y	;Guardo en dir Impares A
	INY		;Incremento Dir Impares
	STY	dirImpa	;Guardo Dir Impares incrementada
	BRA	comun	;Salto a lo comun de los numeros
espar	ROLA		;Acomodo la guazada
	LDY	dirPar	;Cargo dir Pares Y		
	STAA	0,Y	;Guardo en dir Pares A
	INY		;Incremento Dir Pares
	STY	dirPar	;Guardo Dir Pares incrementado
comun	INX		;Incremento X
	CPX	dirFin	;Comparo dir incrementada con X
	BLS	bucle	;Pregunto por carry
fin	BRA	fin	;chau papi