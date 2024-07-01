;Llamada a las macros
include macros1.asm
.model Large ;Tamaño del programa

; ---------------- Segmento de pila ----------
.stack
; ---------------- Variables a utilizar -------
.data
;Donde se guardar las operaciones
operaciones db 800 dup('$'), '$'

;Salto de linea 
skip db 0ah,0dh, ' ', '$'

;Variables para los numeros
fila db 5 dup ('$'), '$'
columna db 5 dup ('$'), '$'

;Maneja la entrada del teclado
handlerentrada dw ?

;Simbolos
mas db 0ah,0dh, '+' , '$'
menos db 0ah,0dh, '-' , '$'
multi db 0ah,0dh, '*' , '$'
divi db 0ah,0dh, '/' , '$'
signo db 5 dup('$'), '$'
signo2 db 5 dup('$'), '$'
signo3 db 5 dup('$'), '$'

;Convertida
conver db 100 dup('$') , '$'

;Rotulos
rotulo  db 0ah,0dh, "              MENU PRINCIPAL" , '$'
marco   db 0ah,0dh, "         *_   _   _   _   _   _ *" , '$'
marco1  db 0ah,0dh, " ^       | `_' `-' `_' `-' `_' `|       ^" , '$'
marco2  db 0ah,0dh, " |       | 1. Nuevo Juego       |       |" , '$'
marco3  db 0ah,0dh, " |       | 2. Continuar         |       |" , '$'
marco4  db 0ah,0dh, " |  (*)  | 3. Puntajes          |  \^/  |" , '$'
marco5  db 0ah,0dh, " |_<''>_ | 4. Reportes          | _(#)_ |" , '$'
marco6  db 0ah,0dh, "o+o \ / \0 5. Salir             0/ \ / (=)" , '$'
marco7  db 0ah,0dh, " 0'\ ^ /\/_   _   _   _   _   _ \/\ ^ /`0*" , '$'
marco8  db 0ah,0dh, "   /_^_\ | `_' `-' `_' `-' `_' `| /_^_\" , '$'
marco9  db 0ah,0dh, "   || || |                      | || ||" , '$'
marco10 db 0ah,0dh, "   d|_|b_T______________________T_d|_|b" , '$'

;Mensaje numero 1
ingrese1 db 0ah,0dh, 'Ingrese el nombre del jugador: ' , '$'

;Salto de linea
saltolinea db 10,'$'

;Tablero
tablero0  db  "   A B C D E F G H " , '$'
tablero1  db  "  |-|-|-|-|-|-|-|-|" , '$'
tablero2  db  "1 |#|#|#|#|#|#|#|#|" , '$'
tablero3  db  "2 | |#|#|#|#|#|#|#|" , '$'
tablero4  db  "3 | | | | | | | | |" , '$'
tablero5  db  "4 | | | | | | | | |" , '$'
tablero6  db  "5 | | | | | | | | |" , '$'
tablero7  db  "6 | | | | | | | | |" , '$'
tablero8  db  "7 |*|*|*|*|*|*|*|*|" , '$'
tablero9  db  "8 |*|*|*|*|*|*|*|*|" , '$'
tablero10 db  "  |-|-|-|-|-|-|-|-|" , '$'
tablero11 db  "   A B C D E F G H" , '$'

;Mensajes
mensaje1  db 0ah,0dh, "Ingrese la fila: " , '$'
mensaje2  db 0ah,0dh, "Ingrese la columna: " , '$'
mensaje3  db 0ah,0dh, "Ingreso en el fila1. " , '$'

;--------------- Segmento de codigo -------------------
.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax

    menu:
        print rotulo
        print marco
        print marco1
        print marco2
        print marco3
        print marco4
        print marco5
        print marco6
        print marco7
        print marco8
        print marco9
        print marco10
        print skip

        getChar

        cmp al,49 ;1 en decimal, ascii 49
		je opcion1
        cmp al,50 ;2 en decimal, ascii 50
		je opcion2
        cmp al,51 ;3 en decimal, ascii 51
		je opcion3
        cmp al,52 ;4 en decimal, ascii 52
		je opcion4
        cmp al,53 ;5 en decimal, ascii 53
		je salir

        jmp menu

    opcion1: 
        clear
        print saltolinea
		print tablero0
        print saltolinea
        print tablero1
        print saltolinea
        print tablero2
        print saltolinea
        print tablero3
        print saltolinea
        print tablero4
        print saltolinea
        print tablero5
        print saltolinea
        print tablero6
        print saltolinea
        print tablero7
        print saltolinea
        print tablero8
        print saltolinea
        print tablero9
        print saltolinea
        print tablero10
        print saltolinea
        print tablero11
        print saltolinea
     

        print saltolinea
        print mensaje1
	    
        ;Empezamos a saber que pieza vamos a mover 
        getChar

        ;Guardamos la fila 
        SUB al,48
        mov fila[0],al

        print saltolinea
        print mensaje2
        getChar

        ;Guardamos la columna
        SUB al,97
        mov columna[0],al

        print saltolinea
        
        ;jmp menu
        jmp movimiento

    movimiento:
        ;Seleccionamos la fila
        ;Limpiamos la variable
        xor ax,ax
        xor bx,bx

        ;Seleccionamos la fila
        mov al, fila[0]

        ;Nos dirigimos a la Fila correspondiente
        cmp al, 1
        je movFila1

        cmp al, 2
        je movFila2

        cmp al, 3
        je movFila3

        cmp al, 4
        je movFila4

        cmp al, 5
        je movFila5

        cmp al, 6
        je movFila6

        cmp al, 7
        je movFila7

        cmp al, 8
        je movFila8

        ;En caso de no existir o un error que se vaya al menu
        jmp menu

    movFila1:
        print saltolinea
        print mensaje3
        print saltolinea
        ;Extraemos el simbolo de tiene actualmente
        
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        mov bl, columna[0]
        mov si, bx

        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        INC SI
        INC SI
        INC SI
        mov cl, tablero2[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero2[SI], 32 ;Agregamos el espacio

        print tablero2

        getChar
        
        ;Agregamos el simbolo en la columna siguiente
        mov tablero3[SI], cl

        ;Hacemos de nuevo el tablero
        getChar
        jmp opcion1
    
    movFila2:
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...

    movFila3:
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...

    movFila4:
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...

    movFila5:
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...

    movFila6:
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...

    movFila7:
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...

    movFila8: 
        ;Extraemos el simbolo de tiene actualmente
       
        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        
        
        

    opcion2: 
        clear
        ;Opcion 2
        getChar

        
        jmp menu
    
    opcion3: 
        clear
        ;Opcion 3
        getChar
        
        jmp menu

    opcion4: 
        clear
        ;Opcion 4
        getChar
        
        jmp menu

    salir:
        close


main endp
end main






