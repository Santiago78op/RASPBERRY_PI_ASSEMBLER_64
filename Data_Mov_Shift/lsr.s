/* 
LSR #n Logical Shift Right. Shifts bits n times right. The n rightmost bits are lost
and the n leftmost bits are set to zero,
LSR Rsource3 Like the previous one but instead of an immediate value the lower byte
of the register specifes the amount of shifting.

*/
.data
value: .quad 0x123456789

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0] // x0 = 23456789

    // pone 4 en el registro x0
    mov x1, #4      // x1 = 00000004
    lsr x2, x0, x1  // x2 = 02345678
    lsr x3, x0, #8  // x3 = 00234567
    lsr x4, x0, #16 // x4 = 00002345
    lsr x5, x0, #32 // x5 = 00000000
    lsr x6, x0, #48 // x6 = 00000000

    mov x0, #0
    ret