/*
ASR #n Arithmetic Shift Right. Like LSR but the leftmost bit before shifting is used
instead of zero in the n leftmost ones.
ASR Rsource3 Like the previous one but instead of an immediate value the lower
byte of the register specifes the amount of shifting.
 */
.data
var1: .quad 0xf000000000000000
var2: .quad 0x1234567890abcdef

.text
.global main
main:
    ldr x0, =var1
    ldr x0, [x0]      // x0 = 00000000

    asr x1, x0, #4    // x0 = 00000000
    asr x2, x0, #8    // x0 = 00000000
    asr x3, x0, #16   // x0 = 00000000
    asr x4, x0, #32   // x0 = 00000000

    mov x0, #0        
    // Se usa el bit mas significativo en lugar de 0
    // en este caso 0
    ldr x0, =var2
    ldr x0, [x0]      // x0 = 90abcdef
    asr x5, x0, #4    // x5 = f90abcde
    asr x6, x0, #8    // x6 = ff90abcd
    asr x7, x0, #16   // x7 = ffff90ab
    asr x8, x0, #32   // x8 = ffffffff

    mov x0, #0        
    ret