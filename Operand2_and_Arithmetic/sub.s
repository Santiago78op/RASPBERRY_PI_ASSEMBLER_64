.text
.global main
main:
    mov x0, #1000
    mov x1, #500

    sub x2, x0, #1
    sub x3, x0, x1

    sub x4, x0, x1, lsl #1
    sub x5, x0, x1, asr #1

    mov w6, #-100
    sub x7, x0, x6
    sub x8, x0, x6, sxtw

    mov x0, #0
    ret