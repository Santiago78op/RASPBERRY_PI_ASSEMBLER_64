/*
    la directiva equ es utilizada para asignar
    un valor a una constante

    define una constante de nombre buffer_size
    con un valor de 500
*/
.equ buffer_size, 500

/*
    la seccion text contiene el codigo a ejecutar
    del programa
*/
.text
/*
    declara la funcion main como global
    puede ser llamada desde otras partes del codigo
*/
.global main
//la funcion main es el punto de entrada del programa
main:  
    /*
        carga el valor de buffer_size que es 500 en el
        registro x0
    /*
    mov x0, #buffer_size
    // finaliza la funcion y devuelve el control al sistema
    ret
