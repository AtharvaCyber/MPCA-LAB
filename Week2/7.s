.data

a: .word 10,20,30,40,50,60,70,80,90,100
sum: .word 0

.text

ldr r1,=a
ldr r2,=sum
mov r4,#0       @initialization
mov r5,#1       @count

l1: ldr r3,[r1]
    add r4,r4,r3
    add r1,r1,#4
    add r5,r5,#1
    cmp r5,#11
    bne l1
    str r4,[r2]
    swi 0x011

.end