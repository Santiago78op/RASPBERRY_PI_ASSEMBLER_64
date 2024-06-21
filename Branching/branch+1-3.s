.text
.global main
main:
    mov x0, #1  // Mueve el valor 1 al registro x0
    neg x0, x0  // Cambia el signo del valor en el registro x0 y guarda el resultado en el mismo registro x0
    adds x1, x0, #1  // Suma 1 al valor en el registro x0 y guarda el resultado en el registro x1
    bcs end  // Si la operación anterior (la suma) generó un acarreo, salta a la etiqueta "end"

    mov x1, #1000  // Si no hubo acarreo, mueve el valor 1000 al registro x1

end:
    mov x0, #0  // En la etiqueta "end", mueve el valor 0 al registro x0
    ret  // Retorna de la función