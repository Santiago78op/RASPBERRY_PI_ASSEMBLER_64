.data
value: .quad 0b10011011

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]

    mvn x1, x0

    movn x2, #0b10011011
    movn x3, #0x8000, lsl #48 //0xFFFF7FFF00000000
    
    mov x0, #0
    ret