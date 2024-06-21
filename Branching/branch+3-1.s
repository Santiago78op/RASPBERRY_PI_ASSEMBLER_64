.text
.global main
main:
    mov x0, #20
    cmp x0, #15
    bgt end

    mov x1, #100

end:
    mov x0, #0
    ret
    