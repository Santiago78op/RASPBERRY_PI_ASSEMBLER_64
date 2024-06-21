/*
ROR #n ROtate Right. Like LSR but the n rightmost bits are not lost but pushed
onto the n leftmost bits

ROR Rsource3 Like the previous one but instead of an immediate value the lower
byte of the register specifes the amount of shifting.
 */
.data
value: .quad 0x1234567890abcdef

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]     // x0 = 90abcdef

    mov x1, #4       // x1 = 00000004  
    ror x2, x0, x1   // x2 = f90abcde
    ror x3, x0, #16  // x3 = ef90abcd
    ror x4, x0, #32  // x4 = cdef90ab
    ror x5, x0, #48  // x5 = bcdef90a

    ror x6, x0, #(64-4)
    ror x7, x0, #(64-16)
    ror x8, x0, #(64-32)
    ror x9, x0, #(64-48)

    mov x0, #0
    ret