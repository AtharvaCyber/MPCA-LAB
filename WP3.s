MOV R0, #10
Cmp R0, #0
Moveq R1, #1
Beq L1
Movmi R1, #3
Bmi L1
Mov R1, #2
L1:
Swi 0x1011