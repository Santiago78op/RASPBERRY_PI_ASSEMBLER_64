.global _start  // Hace que el símbolo _start sea visible globalmente

.data  // Indica que las siguientes líneas contienen datos inicializados
msg:
    .ascii "Enter 3 consecutive digits: "  // Define una cadena de caracteres llamada msg

.bss  // Indica que las siguientes líneas contienen datos no inicializados
input: 
    .space 4  // Reserva 4 bytes de espacio para un búfer llamado input

.text  // Indica que las siguientes líneas contienen código
_start:  // Punto de entrada del programa
    mov x0, 1       // Establece stdout (salida estándar)
    ldr x1, =msg    // Carga la dirección de la cadena de caracteres msg
    mov x2, 28      // Establece el tamaño de msg
    mov x8, 64      // Establece el número de la llamada al sistema para escribir
    svc 0           // Realiza la llamada al sistema para escribir msg en stdout

    mov x0, 0       // Establece stdin (entrada estándar)
    ldr x1, =input  // Carga la dirección del búfer input
    mov x2, 4       // Establece el tamaño del búfer input
    mov x8, 63      // Establece el número de la llamada al sistema para leer
    svc 0           // Realiza la llamada al sistema para leer de stdin al búfer input

    ldr x0, =input  // Carga la dirección del búfer input
    ldrb w1, [x0]   // Carga el primer dígito de input
    sub w1, w1, 48  // Convierte el primer dígito de ASCII a número
    add x0, x0, 1   // Aumenta el desplazamiento de input en 1
    ldrb w2, [x0]   // Carga el segundo dígito de input
    sub w2, w2, 48  // Convierte el segundo dígito de ASCII a número
    add x0, x0, 1   // Aumenta el desplazamiento de input en 1
    ldrb w3, [x0]   // Carga el tercer dígito de input
    sub w3, w3, 48  // Convierte el tercer dígito de ASCII a número
    add w4, w1, w2  // Suma los dos primeros dígitos y almacena el resultado en w4
    add w4, w4, w3  // Añade el tercer dígito a la suma y almacena el resultado en w4

    uxtb x0, w4     // Extiende el valor de retorno
    mov x8, 93      // Establece el número de la llamada al sistema para salir
    svc 0           // Realiza la llamada al sistema para salir del programa
    ret