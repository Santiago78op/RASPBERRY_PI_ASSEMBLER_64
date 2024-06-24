.text
.global main

IsGreater:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    cmp x0, x1                 // Compara los valores en los registros x0 y x1
    bgt Greater                // Si x0 es mayor que x1, salta a la etiqueta Greater

    mov x0, #0                 // Mueve el valor 0 al registro x0
    b end                      // Salta a la etiqueta end

Greater:
    mov x0, #1                 // Mueve el valor 1 al registro x0
end: 
    ldp x29, x30, [sp], #16    // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                        // Retorna del procedimiento

main:
    stp x29, x30, [sp, #-16]!  // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    mov x0, #1                 // Mueve el valor 1 al registro x0
    mov x1, #5                 // Mueve el valor 5 al registro x1
    bl IsGreater               // Llama a la función IsGreater

    ldp x29, x30, [sp], #16    // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    mov x0, #0                 // Mueve el valor 0 al registro x0
    ret                        // Retorna del procedimiento