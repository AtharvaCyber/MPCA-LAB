.data
a: .word 10,20,30,40,50
b: .word 10,20,30,40,50
c: .word 0,0,0,0,0
.text
ldr r0,=a
ldr r1,=b
ldr r2,=c
mov r6,#5
loop:
ldr r3,[r0],#4
ldr r4,[r1],#4
add r5,r3,r4
str r5,[r2],#4
sub r6,r6,#1
cmp r6,#0
bne loop
close : swi 0x11
.end