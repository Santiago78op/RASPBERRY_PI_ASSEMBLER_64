.data  // Cambia a la sección de datos del programa.
input: .asciz "hello everyone"  // Declara una cadena de caracteres terminada en null.
found: .quad 0  // Declara una variable de 64 bits inicializada a 0.

.text  // Cambia a la sección de texto del programa.
.global main  // Hace que la función 'main' sea visible para el enlazador.
main:  // Marca el inicio de la función principal.
    adr x0, input  // Carga la dirección de 'input' en el registro 'x0'.
    adr x1, found  // Carga la dirección de 'found' en el registro 'x1'.
    mov x4, 'o'  // Mueve el valor ASCII de 'o' al registro 'x4'.
    mov x2, #0  // Mueve el valor 0 al registro 'x2'.

search:  // Inicio de la búsqueda.
    ldrb w3, [x0, x2, lsl #0]  // Carga el byte en la dirección 'x0 + x2' en el registro 'w3'.
    cmp w3, #0  // Compara el valor en 'w3' con 0 (el final de la cadena).
    beq end  // Si 'w3' es igual a 0, salta a 'end'.

    cmp w3, w4  // Compara el valor en 'w3' con 'x4' (el carácter que estamos buscando).
    bne cont  // Si 'w3' no es igual a 'x4', salta a 'cont'.

    mov x3, #1  // Mueve el valor 1 al registro 'x3'.
    str x3, [x1]  // Almacena el valor en 'x3' en la dirección 'x1' (marca 'found' como 1).
    b end  // Salta a 'end'.

cont:  // Continúa aquí si 'w3' no es igual a 'x4'.
    add x2, x2, #1  // Incrementa 'x2' en 1.
    b search  // Salta de nuevo al inicio de la búsqueda.

end:  // Fin de la búsqueda.
    mov x0, #0  // Mueve el valor 0 al registro 'x0' para indicar que el programa ha terminado con éxito.
    ret  // Termina la función.
