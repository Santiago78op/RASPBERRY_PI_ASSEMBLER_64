.data  // Esta es una directiva que le indica al ensamblador que cambie a la sección de datos del programa, donde se almacenan los datos inicializados.
items: .byte 10, 20, 30, 40, 50, 60, 70, 80  // Declara un array de bytes con los valores dados. La etiqueta 'items' se usa para referirse a este array.

.text  // Esta es una directiva que le indica al ensamblador que cambie a la sección de texto del programa, donde se almacena el código.
.global main  // Hace que la función 'main' sea visible para el enlazador para que sepa por dónde empezar el programa.
main:  // Es una etiqueta que marca el inicio de la función principal.
    adr x0, items  // Carga la dirección de 'items' en el registro 'x0'.
    ldrb w1, [x0, #2]  // Carga el byte en la dirección 'x0 + 2' en el registro 'w1'. Como los arrays son de índice cero y cada byte tiene un byte de longitud, esta instrucción carga el tercer byte en el array 'items', que es '30'.

    mov x0, #0  // Mueve el valor '0' al registro 'x0'. Esto se usa normalmente para indicar que el programa ha terminado con éxito.
    ret  // Es la instrucción de retorno que termina la función.