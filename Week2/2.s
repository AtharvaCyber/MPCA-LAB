.DATA
A:.WORD 10,20,30,40,50
B:.WORD 0,0,0,0,0

.TEXT
LDR R1,=A
LDR R2,=B

MOV R5,#1	;counter
 L1:LDR R3,[R1]
STR R3,[R2]
ADD R1,R1,#4
ADD R2,R2,#4
ADD R5,R5,#1
CMP R5,#6
BNE L1
SWI 0X011	;software interrupt
