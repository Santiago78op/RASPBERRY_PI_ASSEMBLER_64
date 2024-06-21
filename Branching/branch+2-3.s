.text                      // Indica que las siguientes instrucciones son código ejecutable.
.global main               // Hace que el símbolo 'main' sea visible a otros módulos.
main:                      // Define el inicio de la función 'main'.
    mov x0, #20            // Mueve el valor 20 al registro x0.
    cmp x0, #20            // Compara el valor en el registro x0 con 20.
    blo end                // Si el valor en x0 es menor que 20, salta a la etiqueta 'end'.
    bls end                // Si el valor en x0 es menor o igual a 20, salta a la etiqueta 'end'.

    mov x2, #100           // (Esta línea se saltaría debido al salto condicional anterior) Mueve el valor 100 al registro x2.
end:                       // Define la etiqueta 'end' a la que se salta.
    mov x0, #0             // Mueve el valor 0 al registro x0. Representa un estado de salida exitoso.
    ret                    // Instrucción de retorno que termina la ejecución de la función y devuelve el control al llamador.
