.data
a: .word 0,0,0,0,0,0,0,0,0,0
.text
LDR r0,=a
MOV r1,#0
MOV r2,#1
MOV r4,#2
STMIA r0!,{r1,r2}
BL fib
B exit
fib:
loop:
LDMDB r0,{r1,r2}
ADD r3,r1,r2
STR r3,[r0],#4
ADD r4,r4,#1
CMP r4,#11
BNE loop
MOV PC,LR
exit:
.end