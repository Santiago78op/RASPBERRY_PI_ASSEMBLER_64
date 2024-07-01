;Llamada a las macros
include macros1.asm
.model Large ;Tamaño del programa

; ---------------- Segmento de pila ----------
.stack
; ---------------- Variables a utilizar -------
.data
;Donde se guardar el reporte
reporte db 750 dup(' '), '$'
indiceReporte db 0

;Variables del reporte
handler dw ?
buffer db 1000 dup(' '), '$'
rute db 100 ,'00h'

;Nombre del archivo
nombreArchivo db 'reporte.html',0

;Salto de linea 
skip db 0ah,0dh, ' ', '$'

;Variables para los numeros
fila db 5 dup ('$'), '$'
columna db 5 dup ('$'), '$'

;Variable nombre de usuario
nombreUsuario db 20 dup ('$'), '$'

;Maneja la entrada del teclado
handlerentrada dw ?

;Numero repeticiones
repeticion dw 5 dup ('$'),'$'

;Variables para imprimir el tiempo
tiempoRealDecimal db 9 dup('$'), '$'
tiempoRealASCII db 5 dup('$'), '$'
temporalTiempoReal db 0
temporalTiempoRealASCII db 2 dup('$'), '$'

;Variables para el cronometro
cronometro db 6 dup('$'), '$'
segundos db 2 dup('$'), '$'
minutos db 2 dup('$'), '$'

segundosASCII db 2 dup('$'), '$'
minutosASCII db 2 dup('$'), '$'
temporalTiempo db 0

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
tablero0  db  "  A B C D E F G H " , '$'
tablero1  db  " |-|-|-|-|-|-|-|-|" , '$'
tablero2  db  "1|#|#|#|#|#|#|#|#|" , '$'
tablero3  db  "2|#|#|#|#|#|#|#|#|" , '$'
tablero4  db  "3| | | | | | | | |" , '$'
tablero5  db  "4| | | | | | | | |" , '$'
tablero6  db  "5| | | | | | | | |" , '$'
tablero7  db  "6| | | | | | | | |" , '$'
tablero8  db  "7|*|*|*|*|*|*|*|*|" , '$'
tablero9  db  "8|*|*|*|*|*|*|*|*|" , '$'
tablero10 db  " |-|-|-|-|-|-|-|-|" , '$'
tablero11 db  "  A B C D E F G H" , '$'

;Dashboard

dashboardVS db         "  vs ",'$'
dashboardIA db         "  IA",'$'
dashboardTiempo db     "   Tiempo "
dashboardHoraActual db "   Hora Actual "
dashboardCronometro db 10,'$'

;Mensajes
mensaje1  db 0ah,0dh, "Ingrese la fila: " , '$'
mensaje2  db 0ah,0dh, "Ingrese la columna: " , '$'
mensaje3  db 0ah,0dh, "Ingreso en el fila1. " , '$'
mensaje4  db 0ah,0dh, "Ingrese el nombre usuario: " , '$'
mensaje5  db 0ah,0dh, "Se genero el reporte correctamente." , '$'

;Variables reporte HTML
linea1 db  '<html>$' , 0
linea2 db  '<head>$' , 0
linea3 db  '<title>Reporte </title> ' , '$'
linea4 db 0ah,0dh, '<style>  ' , '$'
linea5 db 0ah,0dh, 'body{background-color: #e6e6ff;} ' , '$'
linea6 db 0ah,0dh, '</style> ' , '$'
linea7 db 0ah,0dh, '</head> ' , '$'
linea8 db 0ah,0dh, '<body>' , '$'

linea9 db 0ah,0dh, '<h2 style="text-align:center;">Practica 3 Arqui 1 Seccion B</h2> ' , '$'
linea10 db 0ah,0dh, '<h4 style="text-align:center;">Estudiante: Carlos Antonio Velasquez Castellanos</h4>' , '$'
linea11 db 0ah,0dh, '<h4 style="text-align:center;">Carnet: 123456789</h4>' , '$'
linea20 db 0ah,0dh, '<div style="text-align:center;"> ' , '$'
linea21 db 0ah,0dh, '<table border="1" style="margin: 0 auto;"> ' , '$'
;linea22 db 0ah,0dh, '<tr>' , '$'
linea23 db 0ah,0dh, ' <td style="text-align:center;"  bgcolor=#006699>ID de Operacion</td> ' , '$'
linea22 db 0ah,0dh, '<tr>' , '$'
linea222 db 0ah,0dh, ' ' , '$'
linea24 db 0ah,0dh, ' <td style="text-align:center;" bgcolor=#006699>Operacion</td> ' , '$'
linea25 db 0ah,0dh, ' <td style="text-align:center;" bgcolor=#006699>Resultado</td> ' , '$'
linea26 db 0ah,0dh, '</tr> ' , '$'

lineaTD db 0ah,0dh, ' <td style="text-align:center;"  bgcolor=#006699> ','$'
lineaTDFin db 0ah,0dh, '</td>','$'

linea27 db 0ah,0dh, '</table> ' , '$'
linea28 db 0ah,0dh, '</div> ' , '$'
linea29 db 0ah,0dh, '</body>' , '$'
linea30 db 0ah,0dh, '</html>' , '$'

;Manejo de errores
err1 db 0ah,0dh, 'Error al abrir el archivo puede que no exista' , '$'
err2 db 0ah,0dh, 'Error al cerrar el archivo' , '$'
err3 db 0ah,0dh, 'Error al escribir en el archivo' , '$'
err4 db 0ah,0dh, 'Error al crear en el archivo' , '$'
err5 db 0ah,0dh, 'Error al leer en el archivo' , '$'


;--------------- Segmento de codigo -------------------
.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax

    inicio:
        ;Colocar valores de inicio a variables
        mov segundos[0],0
		mov minutos[0],0
        xor si, si 
        mov si, 0
        push si

        ;Concatenamos el reporte
        concatenarCadena linea1,reporte,indiceReporte
		concatenarCadena linea2,reporte,indiceReporte
		concatenarCadena linea3,reporte,indiceReporte
		concatenarCadena linea4,reporte,indiceReporte
		concatenarCadena linea5,reporte,indiceReporte
		concatenarCadena linea6,reporte,indiceReporte
		concatenarCadena linea7,reporte,indiceReporte
		concatenarCadena linea8,reporte,indiceReporte
		concatenarCadena linea9,reporte,indiceReporte
		concatenarCadena linea10,reporte,indiceReporte
		concatenarCadena linea11,reporte,indiceReporte
		concatenarCadena linea20,reporte,indiceReporte
		concatenarCadena linea21,reporte,indiceReporte
		concatenarCadena linea22,reporte,indiceReporte
		concatenarCadena linea23,reporte,indiceReporte
		concatenarCadena linea24,reporte,indiceReporte
		concatenarCadena linea25,reporte,indiceReporte
		concatenarCadena linea26,reporte,indiceReporte

        ;jmp menu
        

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
		je eleccionNombre
        cmp al,50 ;2 en decimal, ascii 50
		je opcion2
        cmp al,51 ;3 en decimal, ascii 51
		je opcion3
        cmp al,52 ;4 en decimal, ascii 52
		je opcion4
        cmp al,53 ;5 en decimal, ascii 53
		je salir

        jmp menu


    eleccionNombre: 
        clear
        clear
        print mensaje4
        print saltolinea
        ;Obtener el nombre de usuario
        ObtenerTexto nombreUsuario

        

    opcion1: 
        clear

        obtenerTiempo
        cronometrar
      
        print nombreUsuario
        print dashboardVS
        print dashboardIA
        print dashboardTiempo
        print cronometro
        print saltolinea
        print dashboardHoraActual
        print tiempoRealASCII
        

        print saltolinea

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

        cmp al, 58
        jae opcion1

        cmp al, 47
        jbe opcion1

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
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero2[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero2[SI], 32 ;Agregamos el espacio

       
        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante1

        mov al, 42
        cmp al, cl
        je atras1

        jmp opcion1

        adelante1:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero3[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras1:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero2[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila2:
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero3[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero3[SI], 32 ;Agregamos el espacio

        ;print tablero2

        ;getChar
        
        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante2

        mov al, 42
        cmp al, cl
        je atras2

        jmp opcion1

        adelante2:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero4[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras2:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero2[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila3:
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero4[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero4[SI], 32 ;Agregamos el espacio

        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante3

        mov al, 42
        cmp al, cl
        je atras3

        jmp opcion1

        adelante3:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero5[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras3:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero3[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila4:
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero5[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero5[SI], 32 ;Agregamos el espacio

        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante4

        mov al, 42
        cmp al, cl
        je atras4

        jmp opcion1

        adelante4:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero6[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras4:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero4[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila5:
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero6[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero6[SI], 32 ;Agregamos el espacio

        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante5

        mov al, 42
        cmp al, cl
        je atras5

        jmp opcion1

        adelante5:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero7[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras5:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero5[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila6:
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero7[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero7[SI], 32 ;Agregamos el espacio

        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante6

        mov al, 42
        cmp al, cl
        je atras6

        jmp opcion1

        adelante6:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero8[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras6:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero6[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila7:
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero8[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero8[SI], 32 ;Agregamos el espacio

        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante7

        mov al, 42
        cmp al, cl
        je atras7

        jmp opcion1

        adelante7:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero8[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras7:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero7[SI], cl
            ;Regresamos al menu
            jmp opcion1

    movFila8: 
        ;Seleccionamos la columna
        xor bx, bx
        xor si, si
        
        ;Limpiamos valores
        xor cx, cx

        ;Posiciones columnas 1=3,2=5,3=7,4=9...
        ;Guardamos el simbolo
        mov bl, columna[0]
        mov repeticion,bx
        incremetarSI repeticion
        mov cl, tablero9[SI]

        ;Eliminamos el simbolo de la columna
        mov tablero9[SI], 32 ;Agregamos el espacio

        ;Necesitamos saber que simbolo es y verificar hacia donde avanza
        xor ax,ax
        mov al, 35
        cmp al, cl
        je adelante8

        mov al, 42
        cmp al, cl
        je atras8

        jmp opcion1

        adelante8:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero3[SI], cl
            ;Regresamos al menu
            jmp opcion1

        atras8:
            ;Agregamos el simbolo en la columna siguiente
            mov tablero1[SI], cl
            ;Regresamos al menu
            jmp opcion1
        
        
        

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
        ;clear
        ;Segundo concatenamos el finalizador del documento
		concatenarCadena linea27,reporte,indiceReporte
		concatenarCadena linea28,reporte,indiceReporte
		concatenarCadena linea29,reporte,indiceReporte
		concatenarCadena linea30,reporte,indiceReporte

        ;limpiar rute, SIZEOF rute,24h ;limpiamos el arreglo bufferentrada con $
		;limpiar buffer, SIZEOF buffer,24h ;limpiamos el arreglo bufferentrada con $

        ;limpiar nombreArchivo, SIZEOF nombreArchivo,24h ;limpiamos el arreglo bufferentrada con $

		;ObtenerTexto nombreArchivo
        ;mov nombreArchivo[0],48
		;mov nombreArchivo[1],46
		;mov nombreArchivo[2],72
		;mov nombreArchivo[3],84
		;mov nombreArchivo[4],76
		;mov nombreArchivo[5],116
		;mov nombreArchivo[6],101
		;mov nombreArchivo[7],49
        
		crear nombreArchivo, handler
        escribir  handler, reporte, SIZEOF reporte
		cerrar handler

        clear
        clear

        print saltolinea
        print mensaje5
        print saltolinea
        
        getChar
        clear
        jmp menu
    salir:
        close

    Error1:
		print saltolinea
		print err1
		getChar
		jmp menu

	Error2:
		print saltolinea
		print err2
		getChar
		jmp menu
	
	Error3:
		print saltolinea
		print err3
		getChar
		jmp menu
	
	Error4:
		print saltolinea
		print err4
		getChar
		jmp menu

	Error5:
		print saltolinea
		print err5
		getChar
		jmp menu


main endp

  
end main






