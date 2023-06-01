data 
srcstr : .asciz "HELLO WORLD" 
dststr : .asciz "WELCOME" 

.text 
start: Ldr r1,=srcstr 
ldr r0,=dststr 
strcopy: 
ldrb r2,[r1],#1 
strb r2,[r0],#1 
cmp r2,#0 
bne strcopy 
ldr r0,=srcstr 
swi 0x02 
ldr r0,=dststr 
swi 0x02 
swi 0x1
.end
