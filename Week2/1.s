.data
a: .word 10
b: .word 20
c: .word 0
.text
ldr r0, = a
ldr r1, = b
ldr r2,[r0]
ldr r3,[r1]
add r4,r2,r3
str r4,[r7]
swi 0x011