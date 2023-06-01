.data
a: .word 0
stk: .word 0
.text
LDR r0,=a
MOV r1,#10
MOV r2,#20
MOV r3,#30
BL mulADD /*mul(add(10,20),30)*/
STR r6,[r0]
B exit
mulADD:
LDR r4,=stk
STR LR,[r4]
BL add
MUL r6,r5,r3
LDR LR,[r4]
MOV PC,LR
add:
ADD r5,r2,r1
MOV PC,LR
exit:
.end