.text
.global main
main:
    mov x0, #2000
    adds x1, x0, #1000

    mov x0, #-1
    subs x2, x0, #1

    mov x3, #1
    lsl x4, x3, #63
    subs x5, x4, #1
    
    negs x6, x4

    mov x0, #0
    ret