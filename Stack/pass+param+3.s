.data
array: .quad 1000, 1001, 1002, 1003 // Declara un array con los valores 1000, 1001, 1002, 1003
count: .quad 4                      // Declara una variable count con el valor 4

.text
.global main

ArraySum:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    
    ldp x2, x1, [sp, #16]     // Carga los valores en la pila en los registros x2 y x1
    mov x0, #0                // Mueve el valor 0 al registro x0
Sum:
    ldr x3, [x1], #8          // Carga el valor en la dirección apuntada por x1 en el registro x3, y actualiza x1
    add x0, x0, x3            // Suma los valores en los registros x0 y x3, y guarda el resultado en x0
    subs x2, x2, #1           // Resta 1 del valor en el registro x2, y guarda el resultado en x2
    bne Sum                   // Si x2 no es igual a 0, salta a la etiqueta Sum

    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                       // Retorna del procedimiento

main:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    sub sp, sp, #16           // Resta 16 del valor en el registro sp, y guarda el resultado en sp

    adr x0, count             // Carga la dirección de count en el registro x0
    ldr x0, [x0]              // Carga el valor en la dirección apuntada por x0 en el registro x0
    adr x1, array             // Carga la dirección de array en el registro x1

    stp x0, x1, [sp]          // Guarda los registros x0 y x1 en la pila
    bl ArraySum               // Llama a la función ArraySum

    add sp, sp, #16           // Suma 16 al valor en el registro sp, y guarda el resultado en sp

    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    mov x0, #0                // Mueve el valor 0 al registro x0
    ret                       // Retorna del procedimiento