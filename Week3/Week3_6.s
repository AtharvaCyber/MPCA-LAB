.data
a: .word 0
.text
LDR r0,=a
MOV r1,#10
BL fact
STR r2,[r0]
B exit
fact:
MOV r2,#1
loop:
MUL r2,r2,r1
SUB r1,r1,#1
CMP r1,#0
BGT loop
MOV PC,LR
exit:
.end