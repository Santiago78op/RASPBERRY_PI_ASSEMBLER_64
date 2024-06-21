.global _start  // Hace que el símbolo _start sea visible globalmente

.data  // Indica que las siguientes líneas contienen datos inicializados
msg:
    .ascii "Enter 1 digit: "  // Define una cadena de caracteres llamada msg

.bss  // Indica que las siguientes líneas contienen datos no inicializados
input: 
    .space 2  // Reserva 2 bytes de espacio para un búfer llamado input

.text  // Indica que las siguientes líneas contienen código
_start:  // Punto de entrada del programa
    mov x0, 1       // Establece stdout (salida estándar)
    ldr x1, =msg    // Carga la dirección de la cadena de caracteres msg
    mov x2, 15      // Establece el tamaño de msg
    mov x8, 64      // Establece el número de la llamada al sistema para escribir
    svc 0           // Realiza la llamada al sistema para escribir msg en stdout

    mov x0, 0       // Establece stdin (entrada estándar)
    ldr x1, =input  // Carga la dirección del búfer input
    mov x2, 2       // Establece el tamaño del búfer input
    mov x8, 63      // Establece el número de la llamada al sistema para leer
    svc 0           // Realiza la llamada al sistema para leer de stdin al búfer input

    ldr x0, =input  // Carga la dirección del búfer input
    ldrb w1, [x0]   // Carga el primer dígito de input
    sub w1, w1, 48  // Convierte el primer dígito de ASCII a número
    and w2, w1, 1   // Realiza una operación AND entre el dígito y 1 para comprobar si es par o impar
    add w2, w2, 48  // Convierte el número de nuevo a ASCII
    strb w2, [x0]   // Almacena el resultado (1 para impar, 0 para par) en input

    mov x0, 1       // Establece stdout (salida estándar)
    ldr x1, =input  // Carga la dirección del búfer input
    mov x2, 2       // Establece el tamaño del búfer input
    mov x8, 64      // Establece el número de la llamada al sistema para escribir
    svc 0           // Realiza la llamada al sistema para escribir el contenido del búfer en stdout

    mov x0, 0       // Establece el valor de retorno del programa
    mov x8, 93      // Establece el número de la llamada al sistema para salir
    svc 0           // Realiza la llamada al sistema para salir del programa
/*
La operación and en la línea and w2, w1, 1 es una operación AND a nivel de bits. En este caso, 
se está realizando entre el dígito ingresado por el usuario (almacenado en w1) y el número 1. 
Aquí está cómo funciona:

La operación AND a nivel de bits toma dos números, los compara bit a bit, y devuelve un nuevo 
número donde cada bit es 1 si los bits correspondientes en los dos números eran 1, y 0 en caso 
contrario. Por ejemplo, si el dígito ingresado por el usuario es 7, que en binario es 0111, y 
lo comparamos con 1, que en binario es 0001, la operación AND daría como resultado 0001, que es
1 en decimal. Si el dígito ingresado por el usuario es 6, que en binario es 0110, y lo comparamos
con 1, que en binario es 0001, la operación AND daría como resultado 0000, que es 0 en decimal.

Entonces, ¿por qué estamos comparando con 1? Porque estamos interesados en el bit menos 
significativo del número, que nos dice si el número es par o impar. Si el bit menos significativo
es 1, el número es impar. Si el bit menos significativo es 0, el número es par. Por lo tanto, esta
línea de código está comprobando si el dígito ingresado por el usuario es par o impar. Si el 
resultado de la operación AND es 1, entonces el número es impar. Si el resultado es 0, entonces 
el número es par.
 */