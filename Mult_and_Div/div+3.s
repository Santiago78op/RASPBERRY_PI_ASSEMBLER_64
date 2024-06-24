.text
.global main
main:
    mov x0, #100  // Mueve el valor 100 al registro x0
    mov x1, #7    // Mueve el valor 7 al registro x1
    cmp x1, #0    // Compara el valor en el registro x1 con 0
    beq div0      // Si x1 es igual a 0, salta a la etiqueta div0

    udiv x2, x0, x1 // Realiza una división sin signo de los valores en los registros x0 y x1, y guarda el resultado en x2
    msub x3, x2, x1, x0 // Realiza una multiplicación y resta: x2 - (x1 * x0), y guarda el resultado en x3
    b end           // Salta a la etiqueta end
    
div0:
    // handle div by zero

end:
    mov x0, #0  // Mueve el valor 0 al registro x0
    ret         // Retorna del procedimiento
