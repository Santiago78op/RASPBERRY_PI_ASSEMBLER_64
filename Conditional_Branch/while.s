.data
x: .quad 0  ; Declara una variable 'x' y la inicializa en 0
y: .quad 10 ; Declara una variable 'y' y la inicializa en 10

.text
.global main
main:
    ldr x0, =x  ; Carga la dirección de 'x' en el registro x0
    ldr x1, =y  ; Carga la dirección de 'y' en el registro x1
    ldr x2, [x0]  ; Carga el valor de 'x' (desde la dirección en x0) en el registro x2
    ldr x3, [x1]  ; Carga el valor de 'y' (desde la dirección en x1) en el registro x3

while:
    cmp x2, x3  ; Compara los valores en los registros x2 y x3
    bgt endwhile  ; Si el valor en x2 es mayor que el valor en x3, salta a 'endwhile'

    add x2, x2, #1  ; Incrementa el valor en el registro x2 en 1
    str x2, [x0]  ; Almacena el valor en x2 de vuelta en 'x' (en la dirección en x0)
    b while  ; Salta de vuelta a 'while'

endwhile:
    mov x0, #0  ; Mueve 0 al registro x0
    ret  ; Retorna desde la función

    