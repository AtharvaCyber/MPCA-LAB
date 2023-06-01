.data
a: .word 1,2,3,4,5,6,7,8,9
b: .word 10,20,30,40,50,60,70,80,90
c: .word 0
.text
LDR r0,=a
LDR r1,=b
LDR r2,=c
MOV r5,#0
MOV r6,#1
loop:
LDR r3,[r0],#4
LDR r4,[r1],#4
MLA r5,r3,r4,r5
ADD r6,r6,#1
CMP r6,#10
BNE loop
B exit
exit:
STR r5,[r2]
swi 0x11
.end