.macro min dst, src1, src2
    cmp \src1, \src2          // Compara los valores en los registros src1 y src2
    bgt 1f                    // Si src1 es mayor que src2, salta a la etiqueta 1f
    mov \dst, \src1           // Mueve el valor en el registro src1 al registro dst
    b 2f                      // Salta a la etiqueta 2f
1:
    mov \dst, \src2           // Mueve el valor en el registro src2 al registro dst
2:
.endm                        // Finaliza la macro

.text
.global main
main:
    mov x1, #1                // Mueve el valor 1 al registro x1
    mov x2, #3                // Mueve el valor 3 al registro x2
    min x0, x1, x2            // Llama a la macro min con los argumentos x0, x1, x2

    mov x1, #10               // Mueve el valor 10 al registro x1
    mov x2, #-10              // Mueve el valor -10 al registro x2
    min x3, x1, x2            // Llama a la macro min con los argumentos x3, x1, x2
    
    mov x0, #0                // Mueve el valor 0 al registro x0
    ret                       // Retorna del procedimiento