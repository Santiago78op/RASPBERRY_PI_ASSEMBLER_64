.global _start // Hace que el símbolo _start sea visible para el enlazador. _start es el punto de entrada predeterminado para los programas en Linux.

.data // Define una sección de datos.
out: .ascii " - - - \n" // Define una cadena ASCII que se utilizará para la salida.

.text // Define una sección de texto (código).

_start: // Punto de entrada del programa.
    ldr x1, =out // Carga la dirección de la cadena de salida en el registro x1.

    mov w0, 0b1001 // Mueve el valor binario 1001 (9 en decimal) al registro w0.
    asr w0, w0, 2 // Realiza un desplazamiento aritmético a la derecha por 2 bits en w0. Esto es equivalente a dividir por 4, por lo que el resultado es 0010 (2 en decimal).
    add w0, w0, 48 // Suma 48 (el valor ASCII de '0') a w0 para convertir el número en un carácter ASCII.
    strb w0, [x1] // Almacena el valor de w0 en la dirección apuntada por x1 (la primera posición de la cadena de salida).

    mov w0, 0b10000 // Mueve el valor binario 10000 (16 en decimal) al registro w0.
    lsr w0, w0, 1 // Realiza un desplazamiento lógico a la derecha por 1 bit en w0. Esto es equivalente a dividir por 2, por lo que el resultado es 01000 (8 en decimal).
    add w0, w0, 48 // Suma 48 (el valor ASCII de '0') a w0 para convertir el número en un carácter ASCII.
    strb w0, [x1, 2] // Almacena el valor de w0 en la segunda posición de la cadena de salida.

    mov w0, 0b010 // Mueve el valor binario 010 (2 en decimal) al registro w0.
    lsl w0, w0, 1 // Realiza un desplazamiento lógico a la izquierda por 1 bit en w0. Esto es equivalente a multiplicar por 2, por lo que el resultado es 100 (4 en decimal).
    add w0, w0, 48 // Suma 48 (el valor ASCII de '0') a w0 para convertir el número en un carácter ASCII.
    strb w0, [x1, 4] // Almacena el valor de w0 en la tercera posición de la cadena de salida.

    mov x0, 0b0001 // Mueve el valor binario 0001 (1 en decimal) al registro x0.
    ror x0, x0, 61 // Realiza una rotación a la derecha por 61 bits en x0. Esto es equivalente a rotar los bits a la derecha, por lo que el resultado es 1000 (8 en decimal).
    add w0, w0, 48 // Suma 48 (el valor ASCII de '0') a w0 para convertir el número en un carácter ASCII.
    strb w0, [x1, 6] // Almacena el valor de w0 en la cuarta posición de la cadena de salida.

    mov x0, 1 // Define x0 como 1, que es el descriptor de archivo para stdout.
    mov x2, 8 // Define x2 como 8, que es el tamaño de la cadena de salida.
    mov x8, 64 // Define x8 como 64, que es el número de llamada al sistema para write.
    svc 0 // Realiza una llamada al sistema para escribir la cadena de salida en stdout.

    mov x0, x1 // Define x0 como x1, que es el valor de retorno del programa.
    mov x8, 93 // Define x8 como 93, que es el número de llamada al sistema para exit.
    svc 0 // Realiza una llamada al sistema para terminar el programa.

/*
[x1, 6]: Esta es la dirección de memoria donde queremos almacenar el valor. x1 es un registro de 64 bits que contiene la dirección base.

El 6 es un desplazamiento que se suma a la dirección base para obtener la dirección final de almacenamiento. En este caso, estamos 
almacenando el valor en la séptima posición de la cadena de salida (la numeración comienza desde 0).
 */