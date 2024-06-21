/*
7 mov r0, #2 /* Put a 2 inside the register r0 
Line 7 is the mov instruction which means move. 
We move the integer 2 into the register r0.
*/
.text
.global main
main:
/* 
    mov
    mov with zero
    mov with keep
*/
    mov x0, #1000
    mov x1, x0

    mov x0, #0x1234
    //mov x0, #0x12345

    movz x2, #0x2345
    movk x2, #1, lsl #16

    //mov x2, 0x1234567890abcdef
    movz x3, #0xcdef
    movk x3, #0x90ab, lsl #16
    movk x3, #0x5678, lsl #32
    movk x3, #0x1234, lsl #48

    mov w2, #1000

    mov x0, #0
    ret