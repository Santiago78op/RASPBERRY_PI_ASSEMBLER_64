.text
.global main
main:
    mov x0, #100  // Mueve el valor 100 al registro x0
    mov x1, #2    // Mueve el valor 2 al registro x1
    udiv x2, x0, x1 // Realiza una división sin signo de los valores en los registros x0 y x1, y guarda el resultado en x2

    mov x3, #-1000 // Mueve el valor -1000 al registro x3
    mov x4, #50   // Mueve el valor 50 al registro x4
    sdiv x5, x3, x4 // Realiza una división con signo de los valores en los registros x3 y x4, y guarda el resultado en x5

end:
    mov x0, #0  // Mueve el valor 0 al registro x0
    ret         // Retorna del procedimiento
