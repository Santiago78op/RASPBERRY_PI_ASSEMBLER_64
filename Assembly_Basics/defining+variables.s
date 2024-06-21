// se usa para definir variables
.data
/*
    sum es un entero de 64bits(quadword) con
    un valor incial de 20
*/
sum: .quad 20
// item es un byte con un valor inicial de 10
item: .byte 10
// Es un entero de 32bits(word) con un valor de 5
_counter: .word 5

.text
.global main
main:
    /*
        primero se carga la direccion de la variable sum
        en el registro x0 mediante ldr
    */
    ldr x0, =sum
    /*
        segundo se carga el valor almacenado en la direccion
        apuntada por x0 que es (20) en el mismo registro x0
        mediante ldr
    */
    ldr x0, [x0]
    // retorna el control
    ret
