	ORIG	$0000
S	RMB	2
P	RMB	1
Q	RMB	1
R	RMB	1
	CLR	S
	LDAA	P
	BCC	NOCARRY
NOCARRY	INC	S
	STAA	S+1

