.text
.global main
main:
    mov x0, #10 
    neg x1, x0           // -10
    // lsl equivale a multiplicar
    neg x2, x0, lsl #2   // -10 * 2 = -40

    mov x3, #-200
    neg x4, x3

    mov x5, #0
    neg x6, x5

    mov x0, #0
    ret