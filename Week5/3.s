.data
a: .word 1,2,3,4,5,6,7,8,9
.text
ldr r0,=a
mov r1,#0 @ =Sum
mov r2,#3 @=rows
mov r3,#3 @=columns
mov r4,#0 @=i
mov r5,#0 @=j
for_i:
for_j:
stmfd r13!,{r4,r5}
bl get_addr
ldmfd r13!,{r4,r5,r6}
add r6,r0,r6
ldr r6,[r6]
add r1,r1,r6 @sum[i] += a[i][j]
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
exit: swi 0x011
.end