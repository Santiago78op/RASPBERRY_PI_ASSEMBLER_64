.data
size: .quad 0             // Define una variable 'size' en la sección de datos y la inicializa a 0.

.text
.global main
main:
    ldr x0, =size          // Carga la dirección de 'size' en el registro x0.
    ldr x1, [x0]           // Carga el valor en la dirección apuntada por x0 (el valor de 'size') en el registro x1.

if:
    tst x1, x1             // Realiza una operación AND bit a bit entre x1 y x1 y establece las banderas de estado según el resultado.
    bne endif              // Si el resultado de la operación tst no es cero (es decir, 'size' no es cero), salta a 'endif'.

    mov x1, #1             // Mueve el valor 1 al registro x1.
    str x1, [x0]           // Almacena el valor en x1 (1) en la dirección apuntada por x0 (la ubicación de 'size').

endif:
    mov x0, #0             // Mueve el valor 0 al registro x0.
    ret                    // Retorna del procedimiento.
