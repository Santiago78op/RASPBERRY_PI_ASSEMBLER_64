.text
.global main
main:
    stp x0, x1, [sp, #-48]! // Guarda los registros x0 y x1 en la pila, y actualiza el puntero de la pila
    stp x2, x3, [sp, #16]   // Guarda los registros x2 y x3 en la pila
    stp x4, x5, [sp, #32]   // Guarda los registros x4 y x5 en la pila

    add x0, x0, x1          // Suma los valores en los registros x0 y x1, y guarda el resultado en x0
    sub x2, x3, x2          // Resta el valor en el registro x2 del valor en x3, y guarda el resultado en x2
    add x4, x5, x2          // Suma los valores en los registros x5 y x2, y guarda el resultado en x4
    
    ldp x4, x5, [sp, #32]   // Carga los valores de la pila en los registros x4 y x5
    ldp x2, x3, [sp, #16]   // Carga los valores de la pila en los registros x2 y x3
    ldp x0, x1, [sp], #48   // Carga los valores de la pila en los registros x0 y x1, y actualiza el puntero de la pila

    mov x0, #0              // Mueve el valor 0 al registro x0
    ret                     // Retorna del procedimiento