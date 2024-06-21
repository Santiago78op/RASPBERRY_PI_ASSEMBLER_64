.text
.global main
main:
    mov x0, #0  // Mueve el valor 0 al registro x0
    subs x1, x0, #1  // Resta 1 del valor en el registro x0 y guarda el resultado en el registro x1
    bpl end  // Si el resultado de la operación anterior (la resta) es positivo o cero, salta a la etiqueta "end"
    bmi end  // Si el resultado de la operación anterior (la resta) es negativo, salta a la etiqueta "end"

    mov x1, #1000  // Si el resultado no es ni positivo ni negativo (lo cual es imposible), mueve el valor 1000 al registro x1

end:
    mov x0, #0  // En la etiqueta "end", mueve el valor 0 al registro x0
    ret  // Retorna de la función
