.text
.global main
main:
    mov x0, #0b101011
    mov x1, #0b001000
    tst x0, x1

    mov x2, #0b10001100
    mov x3, #0b00001001
    tst x2, x3

    mov x4, #0b10000100
    tst x4, x3

    mov x0, #0
    ret
/* 
tst Esta instrucción realiza una operación AND bit a bit 
entre los valores en los registros x0 y x1, y actualiza 
las banderas de estado basándose en el resultado. Sin embargo,
no almacena el resultado de la operación.
*/