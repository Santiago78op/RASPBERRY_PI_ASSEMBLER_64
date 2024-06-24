.text
.global main
main:
    // x3 = x2 + x0 * x1
    mov x0, #100  // Mueve el valor 100 al registro x0
    mov x1, #10   // Mueve el valor 10 al registro x1
    mov x2, #300  // Mueve el valor 300 al registro x2
    madd x3, x0, x1, x2 // Realiza una multiplicación y suma: (x0 * x1) + x2, y guarda el resultado en x3

    // x4 = x2 - x0 * x1
    msub x4, x0, x1, x2 // Realiza una multiplicación y resta: x2 - (x0 * x1), y guarda el resultado en x4

    // x5 = -(x0 * x1)
    mneg x5, x0, x1 // Realiza una multiplicación negativa: -(x0 * x1), y guarda el resultado en x5

    smaddl x6, w0, w1, x2 // Realiza una multiplicación con signo y suma larga: (w0 * w1) + x2, y guarda el resultado en x6
    smsubl x7, w0, w1, x2 // Realiza una multiplicación con signo y resta larga: x2 - (w0 * w1), y guarda el resultado en x7
    smnegl x8, w0, w1 // Realiza una multiplicación negativa con signo larga: -(w0 * w1), y guarda el resultado en x8

end:
    mov x0, #0  // Mueve el valor 0 al registro x0
    ret         // Retorna del procedimiento
