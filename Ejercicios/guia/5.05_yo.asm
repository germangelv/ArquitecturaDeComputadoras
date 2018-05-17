	ORG $0000
s	rmb	1
p	rmb	1
q	rmb	1
r	rmb	1


	ORG $8000
inicio	
	ldaa	p
	ldab	q
	aba
	ldab	r
	sba
	staa	s
fin	
	bra	fin	
	
	ORG s
	db	0,20,30,4

	ORG $fffe
	dw inicio
