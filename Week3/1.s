.data
array: .word 5,8,12,17,23,29,36,42,55,78
search_ele: .word 23
array_size: .word 10
success: .asciz "successful search"
failure: .asciz "unsuccessful search"
.text
        mov r4,#0
        ldr r0, =array
        ;ldr r6, [r0]
        ldr r7, =search_ele
        ldr r1,[r7]
        ldr r8,=array_size
        ldr r2,[r8]
        sub r3,r2,#1
        binary_search:
        ldr r6,[r0] 
        cmp r6,r1
        beq successful_search
        add r0,r0,#4
        cmp r3,r4
        beq unsuccessful_search
        add r4,r4,#1
        bl binary_search
        bx lr
        swi 0x11
successful_search:
         ;swi 0x02
         ;.asciz "successful search"
         ldr r5,=success
         b loop
unsuccessful_search:
             ;swi 0x02
             ;.asciz "unsuccessful search"
             ldr r5,=failure
             b loop
loop:
         ldrb r0,[r5],#1
         cmp r0,#0
         swine 0x00
         bne loop
         swi 0x11
end: .end
