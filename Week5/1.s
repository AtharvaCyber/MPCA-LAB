.data 
a: .word 1,2,3,4,5,6,7,8,9 
b: .word 0 

.text 
ldr r0,=a 
ldr r1,=b 
mov r2,#3 
mov r3,#3 
mov r4,#0 
mov r5,#0 
for_i: 
for_j: 
    stmfd r13!,{r4,r5} 
    bl get_addr 
    ldmfd r13!,{r4,r5,r6} 
    add r7,r0,r6 
    add r8,r1,r6 
    ldr r6,[r7] 
    str r6,[r8] 
    add r5,r5,#1 
    cmp r5,r3 
    bne for_j 
    mov r5,#0 
    add r4,r4,#1
    cmp r4,r2
    beq exit
    b for_i
get_addr:
    ldmfd r13!,{r4,r5}
    mla r7,r3,r4,r5
    mov r8,#4
    mul r6,r7,r8
    stmfd r13!,{r4,r5,r6}
bx lr
exit: SWI 0x011
.end