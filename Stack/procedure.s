.text
.global main

myfunc:
    mov x0, #1              // Mueve el valor 1 al registro x0
    ret                     // Retorna del procedimiento

main:
    bl myfunc               // Llama a la función myfunc
    ldr x0, =myfunc         // Carga la dirección de la función myfunc en el registro x0
    blr x0                  // Llama a la función cuya dirección está en el registro x0
    
    mov x0, #0              // Mueve el valor 0 al registro x0
    ret                     // Retorna del procedimiento