.text
.global main
main:
    mov x0, #100  // Mueve el valor 100 al registro x0
    mov x1, #10   // Mueve el valor 10 al registro x1
    mul x2, x0, x1 // Multiplica los valores en los registros x0 y x1, y guarda el resultado en x2

    mov x3, #0x1000000000000000 // Mueve el valor hexadecimal 0x1000000000000000 al registro x3
    mov x4, #16   // Mueve el valor 16 al registro x4
    mul x5, x3, x4 // Multiplica los valores en los registros x3 y x4, y guarda el resultado en x5

    umulh x6, x3, x4 // Realiza una multiplicación sin signo de alto producto de los valores en los registros x3 y x4, y guarda el resultado en x6

end:
    mov x0, #0  // Mueve el valor 0 al registro x0
    ret         // Retorna del procedimiento