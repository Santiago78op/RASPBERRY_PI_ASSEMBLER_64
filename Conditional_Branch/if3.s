.data
x: .quad 10               // Define una variable 'x' en la sección de datos y la inicializa a 10.
y: .quad 50               // Define una variable 'y' en la sección de datos y la inicializa a 50.
z: .quad 10               // Define una variable 'z' en la sección de datos y la inicializa a 10.

.text
.global main
main:
    ldr x0, =x             // Carga la dirección de 'x' en el registro x0.
    ldr x1, =y             // Carga la dirección de 'y' en el registro x1.
    ldr x2, =z             // Carga la dirección de 'z' en el registro x2.
    ldr x3, [x0]           // Carga el valor en la dirección apuntada por x0 (el valor de 'x') en el registro x3.
    ldr x4, [x1]           // Carga el valor en la dirección apuntada por x1 (el valor de 'y') en el registro x4.
    ldr x5, [x2]           // Carga el valor en la dirección apuntada por x2 (el valor de 'z') en el registro x5.

if:
    cmp x3, x4             // Compara los valores en x3 y x4 (los valores de 'x' y 'y').
    ble endif              // Si 'x' es menor o igual a 'y', salta a 'endif'.
    cmp x4, x5             // Compara los valores en x4 y x5 (los valores de 'y' y 'z').
    ble endif              // Si 'y' es menor o igual a 'z', salta a 'endif'.

    mov x3, #100           // Mueve el valor 100 al registro x3.
    str x3, [x0]           // Almacena el valor en x3 (100) en la dirección apuntada por x0 (la ubicación de 'x').

endif:
    mov x0, #0             // Mueve el valor 0 al registro x0.
    ret                    // Retorna del procedimiento.
