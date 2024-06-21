.data
value: .quad 0x1234567890abcdef

.text
.global main
main:
    // * carga el valor de la variable en el registro 0
    ldr x0, =value

    // Carga 1 byte (8 bits) de la memoria apuntada por x0 en el registro w1 
    // (se extiende a 32 bits)
    ldrb w1, [x0]
    // Carga 1 media palabra (16 bits) de memoria en el registro w2
    // (se extiende a 32 bits)
    ldrh w2, [x0]
    // Carga 1 palabra (32 bits) de memoria en el registro w3 
    ldr  w3, [x0]
    
    // Carga un byte con signo de memoria en el registro w4
    // (se extiende a 32 bits
    ldrsb w4, [x0]
    //Carga una media palabra con signo de memoria en w5
    // (se extiende a 32 bits
    ldrsh w5, [x0]
    // Carga 1 palabra con signo de memoria en x6
    // (se extiende a 64 bits
    ldrsw x6, [x0]

    // reestablece x0 a 0
    mov x0, #0
    ret