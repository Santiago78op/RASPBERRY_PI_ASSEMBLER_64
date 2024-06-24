.data
message: .asciz "The sum is %d \n" // Declara una cadena de caracteres con el formato para printf

.text
.global main

Addition:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    sub sp, sp, #16           // Resta 16 del valor en el registro sp, y guarda el resultado en sp
    mov fp, sp                // Mueve el valor en el registro sp al registro fp

    add x0, x0, x1            // Suma los valores en los registros x0 y x1, y guarda el resultado en x0
    add x0, x0, x2            // Suma los valores en los registros x0 y x2, y guarda el resultado en x0
    add x0, x0, x3            // Suma los valores en los registros x0 y x3, y guarda el resultado en x0
    add x0, x0, x4            // Suma los valores en los registros x0 y x4, y guarda el resultado en x0
    add x0, x0, x5            // Suma los valores en los registros x0 y x5, y guarda el resultado en x0
    add x0, x0, x6            // Suma los valores en los registros x0 y x6, y guarda el resultado en x0
    add x0, x0, x7            // Suma los valores en los registros x0 y x7, y guarda el resultado en x0

    str x0, [fp]              // Almacena el valor en el registro x0 en la dirección apuntada por fp

    ldp x8, x9, [fp, #32]     // Carga los valores en la pila en los registros x8 y x9
    add x8, x8, x9            // Suma los valores en los registros x8 y x9, y guarda el resultado en x8
    ldr x0, [fp]              // Carga el valor en la dirección apuntada por fp en el registro x0
    add x0, x0, x8            // Suma los valores en los registros x0 y x8, y guarda el resultado en x0

    add sp, sp, #16           // Suma 16 al valor en el registro sp, y guarda el resultado en sp
    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    ret                       // Retorna del procedimiento

main:
    stp x29, x30, [sp, #-16]! // Guarda los registros x29 y x30 en la pila, y actualiza el puntero de la pila
    sub sp, sp, #16           // Resta 16 del valor en el registro sp, y guarda el resultado en sp

    mov x0, #1                // Mueve el valor 1 al registro x0
    mov x1, #2                // Mueve el valor 2 al registro x1
    mov x2, #3                // Mueve el valor 3 al registro x2
    mov x3, #4                // Mueve el valor 4 al registro x3
    mov x4, #5                // Mueve el valor 5 al registro x4
    mov x5, #6                // Mueve el valor 6 al registro x5
    mov x6, #7                // Mueve el valor 7 al registro x6
    mov x7, #8                // Mueve el valor 8 al registro x7
    mov x8, #9                // Mueve el valor 9 al registro x8
    mov x9, #10               // Mueve el valor 10 al registro x9

    stp x8, x9, [sp]          // Guarda los registros x8 y x9 en la pila
    bl Addition               // Llama a la función Addition

    add sp, sp, #16           // Suma 16 al valor en el registro sp, y guarda el resultado en sp
    
    mov x1, x0                // Mueve el valor en el registro x0 al registro x1
    adr x0, message           // Carga la dirección de message en el registro x0
    bl printf                 // Llama a la función printf

    ldp x29, x30, [sp], #16   // Carga los valores de la pila en los registros x29 y x30, y actualiza el puntero de la pila
    mov x0, #0                // Mueve el valor 0 al registro x0
    ret                       // Retorna del procedimiento