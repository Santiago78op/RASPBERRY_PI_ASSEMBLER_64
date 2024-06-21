.data
x: .quad 10               // Define una variable 'x' en la sección de datos y la inicializa a 10.
y: .quad 5                // Define una variable 'y' en la sección de datos y la inicializa a 5.

.text
.global main
main:
    ldr x0, =x             // Carga la dirección de 'x' en el registro x0.
    ldr x1, =y             // Carga la dirección de 'y' en el registro x1.
    ldr x2, [x0]           // Carga el valor en la dirección apuntada por x0 (el valor de 'x') en el registro x2.
    ldr x3, [x1]           // Carga el valor en la dirección apuntada por x1 (el valor de 'y') en el registro x3.

if:
    cmp x2, x3             // Compara los valores en x2 y x3 (los valores de 'x' y 'y').
    ble else               // Si 'x' es menor o igual a 'y', salta a 'else'.

    mov x4, #100           // Mueve el valor 100 al registro x4.
    str x4, [x0]           // Almacena el valor en x4 (100) en la dirección apuntada por x0 (la ubicación de 'x').
    b endif                // Salta a 'endif'.

else:
    mov x4, #200           // Mueve el valor 200 al registro x4.
    str x4, [x1]           // Almacena el valor en x4 (200) en la dirección apuntada por x1 (la ubicación de 'y').

endif:
    mov x0, #0             // Mueve el valor 0 al registro x0.
    ret                    // Retorna del procedimiento.
