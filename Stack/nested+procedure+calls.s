.text
.global main

proc3:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    mov x1, #0                // Mueve el valor 0 al registro x1
    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                       // Retorna del procedimiento

proc2:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    bl proc3                  // Llama a la función proc3
    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                       // Retorna del procedimiento

proc1:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    bl proc2                  // Llama a la función proc2
    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                       // Retorna del procedimiento

main:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila

    bl proc1                  // Llama a la función proc1
    
    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    
    mov x0, #0                // Mueve el valor 0 al registro x0
    ret                       // Retorna del procedimiento