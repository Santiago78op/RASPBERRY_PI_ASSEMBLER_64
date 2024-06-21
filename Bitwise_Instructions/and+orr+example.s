.text
.global main
main:
    mov x0, #0b10010110
    mov x1, #0b01111011
    and x2, x0, x1

    mov x3, #0b11110001
    mov x4, #0b11001111
    and x5, x3, x4

    mov x6, #0b10001001
    mov x7, #0b01000100
    orr x8, x6, x7

    mov x0, #0
    ret