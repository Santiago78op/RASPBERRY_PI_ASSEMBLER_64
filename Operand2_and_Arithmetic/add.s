.text
.global main
main:
    mov x0, #1000
    mov x1, x0

    add x2, x0, #1
    add x3, x0, x1

    // x0 + x1 * 2
    add x4, x0, x1, lsl #1
    // x0 + x1 / 2
    add x5, x0, x1, asr #1

    mov w6, #-1
    add x7, x0, x6
    /*
        sxtw Esta es una extensión de signo. Significa “Sign eXtend To Word”. 
        Convierte un valor de 32 bits en un valor de 64 bits extendiendo el 
        bit de signo. En este caso, el valor en el registro x6 se trata como 
        un valor de 32 bits y se extiende a 64 bits antes de realizar la suma.
     */
    add x8, x0, x6, sxtw

    mov x0, #0
    ret-