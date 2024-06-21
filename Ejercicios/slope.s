.global _start // Hace que el símbolo _start sea visible para el enlazador. _start es el punto de entrada predeterminado para los programas en Linux.

_start: // Punto de entrada del programa.
    mov x0, 1 // Mueve el valor 1 al registro x0. Este es el valor de x1.
    mov x1, 2 // Mueve el valor 2 al registro x1. Este es el valor de y1.
    mov x3, 3 // Mueve el valor 3 al registro x3. Este es el valor de x2.
    mov x4, 4 // Mueve el valor 4 al registro x4. Este es el valor de y2.

    sub x5, x4, x1 // Resta y1 de y2 y almacena el resultado en x5. Esto calcula la diferencia en y (y2 - y1).
    sub x6, x3, x0 // Resta x1 de x2 y almacena el resultado en x6. Esto calcula la diferencia en x (x2 - x1).

    sdiv x0, x5, x6 // Divide la diferencia en y por la diferencia en x y almacena el resultado en x0. Esto calcula la pendiente de la línea entre los dos puntos.

    mov x8, 93 // Define x8 como 93, que es el número de llamada al sistema para exit.
    svc 0 // Realiza una llamada al sistema para terminar el programa.
