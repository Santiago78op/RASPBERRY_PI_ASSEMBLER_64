.global _start  // Hace que el símbolo _start sea visible globalmente

_start:  // Punto de entrada del programa
    mov x0, 1       // Establece stdout (salida estándar)
    ldr x1, =msg    // Carga la dirección de la cadena de caracteres msg
    mov x2, 18      // Establece el tamaño de msg
    mov x8, 64      // Establece el número de la llamada al sistema para escribir
    svc 0           // Realiza la llamada al sistema para escribir msg en stdout

    mov x0, 0       // Establece stdin (entrada estándar)
    ldr x1, =buf    // Carga la dirección del búfer
    mov x2, 8       // Establece el tamaño del búfer a 8 bytes
    mov x8, 63      // Establece el número de la llamada al sistema para leer
    svc 0           // Realiza la llamada al sistema para leer de stdin al búfer

    mov x0, 1       // Establece stdout (salida estándar)
    ldr x1, =buf    // Carga la dirección del búfer
    mov x2, 8       // Establece el tamaño del búfer a 8 bytes
    mov x8, 64      // Establece el número de la llamada al sistema para escribir
    svc 0           // Realiza la llamada al sistema para escribir el contenido del búfer en stdout

    mov x0, 0       // Establece el valor de retorno del programa
    mov x8, 93      // Establece el número de la llamada al sistema para salir
    svc 0           // Realiza la llamada al sistema para salir del programa

.data  // Indica que las siguientes líneas contienen datos inicializados
msg:
    .ascii "Enter a text: "  // Define una cadena de caracteres llamada msg

.bss  // Indica que las siguientes líneas contienen datos no inicializados
buf:
    .space 8  // Reserva 8 bytes de espacio para un búfer llamado buf
