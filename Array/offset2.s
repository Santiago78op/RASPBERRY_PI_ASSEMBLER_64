.data  // Cambia a la sección de datos del programa.
input: .asciz "hello everyone"  // Declara una cadena de caracteres terminada en null.

.text  // Cambia a la sección de texto del programa.
.global main  // Hace que la función 'main' sea visible para el enlazador.
main:  // Marca el inicio de la función principal.
    adr x0, input  // Carga la dirección de 'input' en el registro 'x0'.

loop:  // Inicio del bucle.
    ldrb w1, [x0]  // Carga el byte en la dirección 'x0' en el registro 'w1'.
    cmp w1, #0  // Compara el valor en 'w1' con 0 (el final de la cadena).
    beq endloop  // Si 'w1' es igual a 0, salta a 'endloop'.

    cmp w1, 'a'  // Compara el valor en 'w1' con 'a'.
    blo cont  // Si 'w1' es menor que 'a', salta a 'cont'.
    cmp w1, 'z'  // Compara el valor en 'w1' con 'z'.
    bhi cont  // Si 'w1' es mayor que 'z', salta a 'cont'.

    sub w1, w1, #32  // Resta 32 de 'w1' para convertir la letra minúscula en mayúscula.

cont:  // Continúa aquí si 'w1' no es una letra minúscula.
    strb w1, [x0], #1  // Almacena el byte en 'w1' en la dirección 'x0' y luego incrementa 'x0'.
    b loop  // Salta de nuevo al inicio del bucle.

endloop:  // Fin del bucle.
    mov x0, #0  // Mueve el valor 0 al registro 'x0' para indicar que el programa ha terminado con éxito.
    ret  // Termina la función.
