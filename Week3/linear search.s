@ binary_search.s

.data
array: .word 2, 4, 6, 8, 10, 12, 14, 16, 18, 20
array_length = 10
search_element = 8

.text
.global _start

_start:

mov r1, #0			@ r1 = low
mov r2, #array_length - 1	@ r2 = high

search_loop:
cmp r1, r2
blt search_fail		@ if low >= high, search has failed

@ calculate mid
mov r3, r1
add r3, r2
lsr r3, #1			@ r3 = (low + high) / 2

@ get array[mid]
ldr r4, =array
lsl r3, #2
add r4, r4, r3			@ r4 = &array[mid]
ldr r5, [r4]			@ r5 = array[mid]

cmp r5, search_element
beq search_success		@ if array[mid] == search_element, search has succeeded

@ update low or high based on comparison result
cmp r5, search_element
blt update_high		@ if array[mid] < search_element, update low
update_low:
add r1, r1, #1		@ low = mid + 1
b search_loop

update_high:
sub r2, r2, #1		@ high = mid - 1
b search_loop

search_success:
mov r0, #1
bl write_string		@ write "Successful Search"
b exit

search_fail:
mov r0, #2
bl write_string		@ write "Unsuccessful Search"
b exit

.end

write_string:
@ r0 = string number

.data
strings:
.word string1 - strings
.word string2 - strings

.asciz "Successful Search\n"
.align
string1:
.asciz "Unsuccessful Search\n"
string2:

.text
mov r1, r0
lsl r1, r1, #2
add r1, r1, #strings
ldr r1, [r1]
add r1, r1, #strings

write_char_loop:
ldrb r2, [r1], #1
cmp r2, #0
beq write_char_done
mov r7, #4
mov r0, r2
swi 0
b write_char_loop

write_char_done:
mov r0, #0
swi 0
bx lr

exit:
swi 0

