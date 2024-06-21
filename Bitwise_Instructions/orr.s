.data
value: .quad 0b10011011

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]
    /*
        x0 = 10011011 = 155
        x1 = 00101110 = 46
        x2 = 10111111 = 191
     */
    mov x1, #0b101110
    orr x2, x0, x1
    /*
        x0 = 10011011 = 155
        x1 = 00000000 = 0
        x3 = 10011011 = 155
     */
    mov x1, #0
    orr x3, x0, x1
    /*
        x0 = 10011011 = 155
        x1 = 11111111 = 255
        x2 = 11111111 = 255
     */
    mov x1, #0b11111111
    orr x4, x0, x1

    mov x0, #0
    ret