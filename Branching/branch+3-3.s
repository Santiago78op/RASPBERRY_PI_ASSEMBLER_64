.text
.global main
main:
    mov x0, #-10
    cmp x0, #10
    blt end       // Si el valor en x0 es menor que 10, salta a la etiqueta 'end'.

    mov x1, #1000

end:
    mov x0, #0
    ret