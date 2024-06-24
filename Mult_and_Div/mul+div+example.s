.data
varA: .quad 10     // Declara la variable varA con el valor 10
varB: .quad 60     // Declara la variable varB con el valor 60
varC: .quad 50     // Declara la variable varC con el valor 50
value: .quad 0     // Declara la variable value con el valor 0
divzero: .quad 0   // Declara la variable divzero con el valor 0

.text
.global main
main:
    adr x0, varA    // Carga la dirección de varA en el registro x0
    ldr x0, [x0]    // Carga el valor de varA en el registro x0
    adr x1, varB    // Carga la dirección de varB en el registro x1
    ldr x1, [x1]    // Carga el valor de varB en el registro x1
    adr x2, varC    // Carga la dirección de varC en el registro x2
    ldr x2, [x2]    // Carga el valor de varC en el registro x2

    // value = (varA * -100)/(varB - varC)
    subs x3, x1, x2     // Realiza la operación varB - varC y guarda el resultado en x3
    beq zero            // Si el resultado es cero, salta a la etiqueta zero

    mov x4, #-100       // Mueve el valor -100 al registro x4
    mul x5, x0, x4      // Multiplica varA * -100 y guarda el resultado en x5

    sdiv x5, x5, x3     // Realiza la división (varA * -100) / (varB - varC) y guarda el resultado en x5
    adr x0, value       // Carga la dirección de value en el registro x0
    str x5, [x0]        // Almacena el valor de x5 en la dirección apuntada por x0 (value)
    b end               // Salta a la etiqueta end

zero:
    adr x0, divzero     // Carga la dirección de divzero en el registro x0
    mov x1, #1          // Mueve el valor 1 al registro x1
    str x1, [x0]        // Almacena el valor de x1 en la dirección apuntada por x0 (divzero)

end:
    mov x0, #0          // Mueve el valor 0 al registro x0
    ret                 // Retorna del procedimiento
