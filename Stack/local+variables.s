.text
.global main

myfunc:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    mov x0, #100              // Mueve el valor 100 al registro x0
    mov x1, #200              // Mueve el valor 200 al registro x1
    sub sp, sp, #16           // Resta 16 del valor en el registro sp, y guarda el resultado en sp
    mov fp, sp                // Mueve el valor en el registro sp al registro fp

    str x0, [fp]              // Almacena el valor en el registro x0 en la dirección apuntada por fp
    str x1, [fp, #8]          // Almacena el valor en el registro x1 en la dirección apuntada por (fp + 8)

    ldr x2, [fp]              // Carga el valor en la dirección apuntada por fp en el registro x2
    ldr x3, [fp, #8]          // Carga el valor en la dirección apuntada por (fp + 8) en el registro x3

    add sp, sp, #16           // Suma 16 al valor en el registro sp, y guarda el resultado en sp
    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                       // Retorna del procedimiento

main:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila

    bl myfunc                 // Llama a la función myfunc

    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    mov x0, #0                // Mueve el valor 0 al registro x0
    ret                       // Retorna del procedimiento