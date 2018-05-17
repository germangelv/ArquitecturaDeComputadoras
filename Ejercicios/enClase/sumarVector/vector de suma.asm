	ORG	$0000	//Dir de inicio de variables
dirIni	RMB	2	//Dir de inicio de vector
dirFin	RMB	2	//Dir de fin de vector
suma	RMB	2	//Dir de suma final
	ORG	$C000	//Dir de inicio de programa
	CLRA		//Limpio A
	CLR	suma	//Limpio suma
	LDX	dirIni	//Cargo en registro X direccion de inicio de vector
bucle	ADDA	0,X	//Cargo la posicion inicial o actual de vector en A
	BCC	sincary	//Si no hubo carry salto, sino incremento
	INC	suma	//Incremento en un byte la parte alta de suma (ya que suma tiene la direccion alta por como ensambla)
sincary	INX		//Incremento el registro X que tiene la direccion de memoria actual de la posicion sumada del vector
	CPX	dirFin	//Comparo X con la direccion de fin
	BLS	bucle	//Salto si lo anterior de X es mas chico que lo que se encuentra en X
	STAA	suma+1	//Guardo en la parte baja lo acumulado en A
fin	BRA	fin	//Salto de fin
