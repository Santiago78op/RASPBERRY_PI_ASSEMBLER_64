/*
LSL #n Logical Shift Left. Shifts bits n times left. The n leftmost bits are lost and
the n rightmost are set to zero.
LSL Rsource3 Like the previous one but instead of an immediate value the lower byte
of the register specifes the amount of shifting.
 */
.data
value: .quad 0x11011011

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]   // x0 = 0x11011011

    // pone 4 en el registro x1
    mov x1, #4   // x1 = 00000004
    /*
        Realizan un desplazamineto logico a LA IZQUIERDA
        el valor de x0 por 4 y se almacena el resultado en
        x2 = 0x110110110000
    */
    lsl x2, x0, x1  // x2 = 10110110
    lsl x2, x0, #4  // x2 = 10110110
    lsl x3, x0, #8  // x3 = 01101100
    lsl x4, x0, #16 // x4 = 10110000
    lsl x5, x0, #32 // x5 = 00000000
    lsl x6, x0, #48 // x6 = 00000000

    mov x0, #0
    ret