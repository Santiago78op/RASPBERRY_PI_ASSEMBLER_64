.data
value: .quad 0b10011011

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]

    mov x1, #0b101110   
    and x2, x0, x1
    /* 
        x0 = 10011011 = 155
        x1 = 00101110 = 46
        x2 = 00001010 = 10
    */
    mov x1, #0
    and x3, x0, x1
    /* 
        x1 = 00000000 = 0
        x0 = 10011011 = 155
        x3 = 0 
    */
    mov x1, #0b11111111
    and x4, x0, x1
    /* 
        x1 = 0011111111 = 255
        x0 =   10011011 = 155
        x4 =   10011011 = 155
    */
    mov x0, #0
    ret