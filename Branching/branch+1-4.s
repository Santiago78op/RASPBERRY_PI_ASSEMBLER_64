.text
.global main
main:
    movz x0, #0x8000, lsl #48  // Mueve el valor 0x8000 (en hexadecimal) al registro x0, desplazándolo a la izquierda 48 bits
    subs x1, x0, #1  // Resta 1 del valor en el registro x0 y guarda el resultado en el registro x1
    bvs end  // Si la operación anterior (la resta) generó un desbordamiento, salta a la etiqueta "end"

    mov x1, #1000  // Si no hubo desbordamiento, mueve el valor 1000 al registro x1

end:
    mov x0, #0  // En la etiqueta "end", mueve el valor 0 al registro x0
    ret  // Retorna de la función