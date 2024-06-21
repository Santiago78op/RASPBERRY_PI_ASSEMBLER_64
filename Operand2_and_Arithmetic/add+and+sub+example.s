.data
varA: .quad 100
varB: .quad 200
varC: .quad 50
varD: .quad 10
value: .quad 0

.text
.global main
main:
    // -varA + varB - (varC - varD*2)
    ldr x0, =varA
    ldr x1, =varB
    ldr x2, =varC
    ldr x3, =varD

    ldr x0, [x0]  // varA
    ldr x1, [x1]  // varB
    ldr x2, [x2]  // varC
    ldr x3, [x3]  // varD

    neg x0, x0               // x0 = -varA
    add x0, x0, x1           // x0 = -varA + varB
    sub x2, x2, x3, lsl #1   // x2 = varC - varD*2
    sub x0, x0, x2           // x0 = x0 - x2

    ldr x1, =value
    // str: Esta instruccion de almacenamientro. 
    // Se utiliza para guardar un valor un valor en la memoria.
    str x0, [x1]

    mov x0, #0
    ret
