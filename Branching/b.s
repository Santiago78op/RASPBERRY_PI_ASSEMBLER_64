.text
.global main
main:
    b end
    ldr x0, =end
    br x0

    mov x1, #1
    add x2, x1, #2

end:
    mov x0, #0
    ret