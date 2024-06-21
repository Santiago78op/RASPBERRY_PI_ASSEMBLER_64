// define las variables
.data
value:  .quad 0x1234567890abcdef
dst1: .quad 0
dst2: .quad 0
dst3: .quad 0
dst4: .quad 0

.text
.global main
main:
 
    ldr x0, =value
    ldr x0, [x0]

    // Carga las direcciones de dst1 adst4 en los
    // registrros x1 a x4
    ldr x1, =dst1
    ldr x2, =dst2
    ldr x3, =dst3
    ldr x4, =dst4
	
    // Almacena el valor de x0 que es (value) en la
    // direccion almacenada en x1 que es (dst1)
    str x0, [x1]
    // Almacena el byte menos significativo del valor w0
    // (version de 32 bits de x0) en la direccion almacenada
    // x2 que es (dst2)
    strb w0, [x2] 
    // Almacena la mirad menos significativa (16 bits) del valor w0
    // en la direccion almacenada x3 que es (dst3)
    strh w0, [x3]
    // Almacena el valor de w0, en la direccion x4 que es (dst4)
    str w0, [x4]

    mov x0, #0
    ret