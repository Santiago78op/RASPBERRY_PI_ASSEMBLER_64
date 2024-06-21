.text                      // Indica que las siguientes instrucciones son código ejecutable.
.global main               // Hace que el símbolo 'main' sea visible a otros módulos.
main:                      // Define el inicio de la función 'main'.
    mov x0, #5             // Mueve el valor 5 al registro x0.
    cmp x0, #1            // Compara el valor en el registro x0 con 1.
    bhi endn              // Si el valor en x0 es mayor que 1, salta a la etiqueta 'endn'.
    mov x1, #10           // (Esta línea se saltaría debido al salto condicional anterior) Mueve el valor 10 al registro x1.
end:                       // Define la etiqueta 'endn' a la que se salta.
    mov x0, #0            // Mueve el valor 0 al registro x0. Representa un estado de salida exitoso.
    ret                    // Instrucción de retorno que termina la ejecución de la función y devuelve el control al llamador.
