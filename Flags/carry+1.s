.text
.global main
main:
    mov x0, #10
    // Para habitar la flag debe estar el prefijo s
    adds x1, x0, #1

    mov x2, #-1
    adds x3, x2, #1

    mov x0, #0
    ret