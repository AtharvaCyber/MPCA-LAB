MOV AX ; move the first number to AX
MOV BX ; move the second number to BX
CMP AX, BX ; compare AX and BX
JG L1 ; if AX > BX, jump to label L1
XCHG AX, BX ; otherwise, exchange the values of AX and BX
L1:
MOV CX, AX ; move AX to CX
MOV DX, BX ; move BX to DX
MOD CX, DX ; DX = CX % DX
CMP DX, 0 ; compare DX and 0
JE L2 ; if DX == 0, jump to label L2
MOV CX, DX ; move DX to CX
JMP L1 ; jump to label L1
L2:
MOV, CX ; move CX to memory location Result
