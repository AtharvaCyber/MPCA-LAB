.data
a: .word 16,10,32,52,4,9,20,13,90
b: .word -1
.text
LDR r0,=a
LDR r1,[r0],#4
LDR r4,=b
MOV r3,#1
loop:
LDR r2,[r0],#4
CMP r1,r2
MOVGT r1,r2
ADD r3,r3,#1
CMP r3,#9
BNE loop
B exit
exit:
STR r1,[r4]
swi 0x11
.end