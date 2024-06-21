.data  // Cambia a la sección de datos del programa.
value: .word 0x12345678  // Declara una palabra (4 bytes) con el valor hexadecimal dado.

.text  // Cambia a la sección de texto del programa.
.global main  // Hace que la función 'main' sea visible para el enlazador.
main:  // Marca el inicio de la función principal.
    ldr x0, =value  // Carga la dirección de 'value' en el registro 'x0'.
    ldrb w1, [x0], #1  // Carga el byte en la dirección 'x0' en el registro 'w1' y luego incrementa 'x0' en 1.
    ldrb w2, [x0], #1  // Carga el byte en la dirección 'x0' en el registro 'w2' y luego incrementa 'x0' en 1.
    ldrb w3, [x0], #1  // Carga el byte en la dirección 'x0' en el registro 'w3' y luego incrementa 'x0' en 1.
    ldrb w4, [x0]  // Carga el byte en la dirección 'x0' en el registro 'w4'.

    mov x0, #0  // Mueve el valor 0 al registro 'x0' para indicar que el programa ha terminado con éxito.
    ret  // Termina la función.
