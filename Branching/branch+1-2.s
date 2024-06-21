.text
.global main
main:
    mov x0, #100  // Mueve el valor 100 al registro x0
    subs x1, x0, #50  // Resta 50 del valor en el registro x0 y guarda el resultado en el registro x1
    beq end  // Si el resultado de la operación anterior (la resta) es cero, salta a la etiqueta "end"

    mov x2, #10  // Si el resultado no es cero, mueve el valor 10 al registro x2
    bne end  // Si el resultado de la operación anterior (la resta) no es cero, salta a la etiqueta "end"

    mov x3, #20  // Si el resultado es cero, mueve el valor 20 al registro x3

end:
    mov x0, #0  // En la etiqueta "end", mueve el valor 0 al registro x0
    ret  // Retorna de la función