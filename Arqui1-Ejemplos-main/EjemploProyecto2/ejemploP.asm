;Macros que se pueden llamar
include macros.asm 
.model Large 
; -------------- SEGMENTO DE PILA -----------------
.stack 
; -------------- Variables a utilizar -----------------
.data 

;******************* Variables Globales Inicio **********************
 comando db 50 dup('$'), '$'
 decimalProm db 30 dup('z'), '$'
 decimalConvertido db 10 dup('$'), '$'
 limiteDecimales db 2 dup('$'), '$'
 numeroDeNumeros db 2 dup('$'), '$'
 agregarPunto db 2 dup('$'), '$'
 casoUnico db 2 dup('$'), '$'

 limiteDecimalesCalc db 2 dup('$'), '$'


;******************* Variables Globales FIN ***********************

;******************* Variables calcular primo INICIO ************************
    contadorPrimo db 3 dup('$'), '$'

;******************* Variables calcular primo FIN ************************

;*******************Variables burbuja Inicio ******************
 contador3 db 2 dup('$'), '$'
 
 contador1 db 2 dup('$'), '$'
 contador2 db 2 dup('$'), '$'
  


;*******************Variables shell FIN **********************

;*******************Variables lectura INICIO ******************
 bufferEntrada db 10000 dup('$'), '$'
 csv  db 10000 dup('$'), '$'

 comparador db 2 dup('$'), '$'
 unCaracter db 2 dup('$'), '$'

 numeroAnalizar db 5 dup('$'), '$'
 cantidadNumero db 2 dup('$'), '$'
 

 archivoNombre db 25 dup('$'), '$'
 handlerentrada dw ?

;*******************Variables lectura FIN ******************

;*******************Variables conversion INICIO ******************
 
 decimalesReales db 1000 dup('z'), '$'
 ;decimalesReales db 10 dup('z'),'$'
 decimalesConvertidos db 10000 dup('$'), '$'
 contador11 db 2 dup('$'), '$'
 contador22 db 2 dup('$'), '$'

 

;*******************Variables conversion FIN ******************



;*******************Mensajes Error INICIO********************
 ;Mensaje numero 1
 msj1 db 0ah,0dh, 'Se encontro un error en el archivo CSV,verificar archivo. ' , '$'
 err1 db 0ah,0dh, 'Error al abrir el archivo puede que no exista' , '$'
 err2 db 0ah,0dh, 'Error al cerrar el archivo' , '$'
 err3 db 0ah,0dh, 'Error al escribir en el archivo' , '$'
 err4 db 0ah,0dh, 'Error al crear en el archivo' , '$'
 err5 db 0ah,0dh, 'Error al leer en el archivo' , '$'
 err6 db 0ah,0dh, 'Comando invalido, intente de nuevo.' , '$'

;*******************Mensajes Error FIN*********************

;******************* MODO VIDEO INICIO ************************
  


;******************* MODO VIDEO FIN ***************************

;****************** Comandos para realizar comparacion *******************
  cprom db 'prom' , '$'
  salir db 'salir' , '$'
  ;Aqui podrian agregar mas comandos solo verifiquen como funciona el ingresarComandos.

  resultadoLexema db 2 dup('$'), '$'
  numeroOpcion db 2 dup('$'), '$'

  
  
  
    
;***************** Cadenas del reporte FIN ********************

;******************* Mensajes del Menu INICIO *************
  consola db 'ConsolaPF2> ' , '$'
  cr          equ   0dh   
  lf          equ   0ah
  dolar       equ   '$'   

;********************** Comandos Lectura ****************
 

;******************* Comandos Lectura Fin ****************

;******************** Variables DEBUG*******************
 Debug1 db 0ah,0dh, 'Paso 1 ' , '$'
 Debug2 db 0ah,0dh, 'Paso 2 ' , '$'
 Debug3 db 'Paso 3' , '$'
 caracter db 1 dup('$'), '$'
 espacio db 1 dup('$'), '$'

 caracterTest db 4 dup('$'), '$'
 
 Op1 db 'Opcion 1 ' , '$'
 Op2 db 0ah,0dh, 'Opcion 2 ' , '$'
 Op3 db 0ah,0dh, 'Opcion 3 ' , '$'
 Op4 db 0ah,0dh, 'Opcion 4 ' , '$'
 Op5 db 0ah,0dh, 'Opcion 5 ' , '$'
 Op6 db 0ah,0dh, 'Opcion 6 ' , '$'
 Op7 db 0ah,0dh, 'Opcion 7 ' , '$'
 Op8 db 0ah,0dh, 'Opcion 8 ' , '$'
 Op9 db 0ah,0dh, 'Opcion 9 ' , '$'
 Op10 db 0ah,0dh, 'Opcion 10 ' , '$'
 Op11 db 0ah,0dh, 'Opcion 11 ' , '$'
 Op12 db 0ah,0dh, 'Opcion 12 ' , '$'
 Op13 db 0ah,0dh, 'Opcion 13 ' , '$'
 Op14 db 0ah,0dh, 'Opcion 14 ' , '$'
 

;******************** Variables DEBUG*******************
 saltolinea db 10,'$'

;******************** Variables Reporte *******************
 ;ALMACENA TODOS LOS RESULTADOS


;******************** Variables Reporte *******************
 


;----------------SEGMENTO DE CODIGO---------------------

.code
main proc far	
mov ax,@data
mov ds,ax
mov es,ax

;**************Primero que se ejecuta al abrir el programa*************
    principio:
        clear 
		
		;Al ser un ejemplo tendremos ya en la matriz decimalesReales como si ya tuvieramos cargado el CSV.
		;Ademas la separacion entre cada numero existe un 0, asi lo trabaje yo.
		mov decimalesReales[0],0d
		mov decimalesReales[1],85d
		mov decimalesReales[2],0d
		mov decimalesReales[3],35d
		mov decimalesReales[4],0d
		mov decimalesReales[5],17d
		mov decimalesReales[6],0d
		mov decimalesReales[7],12d
		mov decimalesReales[8],0d
		mov decimalesReales[9],16d
		mov decimalesReales[10],0d
		mov decimalesReales[11],67d
		mov decimalesReales[12],0d
		mov decimalesReales[13],34d
		mov decimalesReales[14],0d
		mov decimalesReales[15],85d
		mov decimalesReales[16],0d
		mov decimalesReales[17],14d
		mov decimalesReales[18],0d
		mov decimalesReales[19],97d
		mov decimalesReales[20],122d
		
		
		jmp menu
		
;****************************** Menu INICIO **************************
    menu:
	    print consola

        ;Esta macro compara los comandos validos, dentro de esta macro se ingresa el comando y va comparando 
		;Caracter por caracter entre los comandos validos que se pueden elegir
		;El resultado de la opcion elegida queda guarda en numeroOpcion[0]
        ingresarComando

		;Nos movemos a la opcion elejida
		mov al, numeroOpcion[0]
		cmp al, 0
		je opcion1
		;cmp al, 1
		;je opcion2
		;cmp al, 2
		;je opcion3
		;cmp al, 3
		;je opcion4
		;cmp al, 4
		;je opcion5
		cmp al, 13
		je opcion13
		
		
		print saltolinea
		print err6
	    getChar
		print saltolinea
        
        jmp menu
	   
;****************************** Menu FIN ******************************

;******************************* Opciones en el Menu INICIO************
    opcion1:
        ;Primero leen el buffer y extraen cada uno de los valores para que los puendan analizar
		
		;Segundo ya que tienen los valores del csv convierten esos ASCII a decimales que puedan trabajarlos.
        
		;Calculan el promedio de los valores decimales que tienen en la variable decimalesReales
        call calcularPromedio
		;Imprimimos el valor de consola
		print consola
		;imprimimos el decimal del promedio
		print decimalConvertido
		print saltolinea
		;limpiamos el decimal, esta macro remplaza el valor de la variable parametro1 = "nombreVariable", parametro2 = tamaño variable, parametro3 = caracter de relleno
		limpiar decimalProm,30,36
        limpiar decimalConvertido,10,36
		
        jmp menu 


	opcion13:
			close   
  
  ;******************************* Opciones en el Menu FIN ****************

;****************************** Errores del programa INICIO ***********
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

    Error6:
	    print saltolinea
	    print msj1
		getChar
		jmp menu




;****************************** Errores del programa FIN********************************
	
;************************** Procedimientos INICIO *************************
    recovertirDecimalesReales proc
	    mov contador1[0], 0
		mov contador2[0], 0 

		;decimalesConvertidos
        limpiarTodo
		principio:
		   mov ah, decimalesReales[si]
		   inc si 
		   
           ;Condicion de salida
		   cmp ah, 122
		   je fin

		   mov al, decimalesReales[si]
		   inc si 

		   jmp Inicio

		Inicio:
			cmp ax,0
			je Mientras
			mov dx,0
			mov cx,10
			div cx
			mov bx,dx
			add bx,30h
			push bx
			
			xor bx, bx
			mov bl, contador1[0]
			add bl, 1
			mov contador1[0], bl

			jmp Inicio

		Mientras:
			;condicion de salida
			xor ax,ax
			xor bx,bx
			mov al, contador1[0]
			mov bl, contador2[0]
			cmp al, bl
			je temporal


			pop bx 
			mov decimalesConvertidos[di],bl
			inc di

            xor bx, bx
			mov bl, contador2[0]
			add bl, 1
			mov contador2[0], bl

			jmp Mientras

		temporal:
		    mov contador1[0], 0
		    mov contador2[0], 0

			mov decimalesConvertidos[di],44
			inc di 
			jmp principio

		fin:
		   ret

		


         

	recovertirDecimalesReales endp

    calcularPromedio proc 
        limpiarTodo
		mov limiteDecimales[0], 0
		mov limiteDecimalesCalc[0], 0
		mov numeroDeNumeros[0], 0
		mov agregarPunto[0], 0
		mov casoUnico[0],2
		limpiar decimalProm, 30 , 122
		limpiarTodo

        Inicio: 
		    xor ax, ax
		    mov ah, decimalesReales[si]
			inc si
            ;en caso se encontro el fin del archivo deje como el ascii de Z para decir que llegue al fin del archivo
			cmp ah, 122
			je restablecer
            mov al, decimalesReales[si]
			inc si 
			;Sumamos todos los numeros
			add bx, ax
			;guardamos el numero de numeros
			xor ax, ax
            mov al, numeroDeNumeros[0]
            add al, 1
			mov numeroDeNumeros[0], al
			;Volvemos aumentar
			jmp Inicio
		
		restablecer:
		    xor si, si
			xor ax, ax
			mov ax, bx
            jmp dividir

		dividir:
            

		    ;Operamos
			xor cx, cx
			mov cl, numeroDeNumeros[0]

			

            ;Verificamos que ax > cx
			cmp ax, cx
			jb casoEspecial 
			
		    div cx

			

			;guardamos el resultado positivo
			mov decimalProm[si], ah
			inc si
			mov decimalProm[si], al
			inc si  

			;Comparamos 
			cmp dx, 0
			je limpiarT 
			 

			;verificamos el limite de los decimales
			mov bl, limiteDecimales[0]
            cmp bl, 3
			je limpiarT 
         
            
            ;Si llego hasta este punto el dx no es cero
			;Multiplicamos dx por 10 y lo movemos ax
			xor ax, ax
			xor cx, cx 
			mov ax, dx 
			mov cx, 10
			mul cx

			;Aumentamos el contador de los decimales
		    xor bx, bx
            mov bl, limiteDecimales[0]
            add bl, 1
			mov limiteDecimales[0], bl
            
            ;Caso unico
			mov casoUnico[0], 1


			jmp dividir

        casoEspecial:
            ;guardamos el resultado positivo
			mov decimalProm[si], 0
			inc si
			mov decimalProm[si], 0
			inc si  

			;verificamos el limite de los decimales
			mov bl, limiteDecimales[0]
            cmp bl, 3
			je limpiarT 
         
            ;Aumentamos el contador de los decimales
		    xor bx, bx
            mov bl, limiteDecimales[0]
            add bl, 1
			mov limiteDecimales[0], bl

			

		    ;Si llego hasta este punto el dx no es cero
			mov cx, 10
			mul cx

            
            ;Caso unico
			mov casoUnico[0], 1

	        jmp dividir

		limpiarT:
           ;Verificamos que no sea entero unico
           xor bx, bx
		   mov bl, casoUnico[0]
		   cmp bl, 2
		   je guardarEntero
		   xor bx,bx

           ;De lo contrario si tenia decimales
		   limpiarTodo

           ;LO QUE SE GUARDA EN DECIMAL
           ;print saltolinea
		   ;print decimalProm 
		   ;print saltolinea
           ;jmp fin 
		   xor di,di

           
           jmp convertirNumero

		guardarEntero:
		    ;guardamos el resultado positivo
			;mov decimalProm[si], ah
			;inc si
			;mov decimalProm[si],al
			;inc si  

			;De lo contrario si tenia decimales
		    limpiarTodo

            ;LO QUE SE GUARDA EN DECIMAL
			;print saltolinea
		    ;print decimalProm 
		    ;print saltolinea
			xor di, di 

			jmp convertirNumero

		convertirNumero:
			;Este macro convierte decimal a el decimal pero en ASCII parametro1= el numero en decimal, parametro2=variable para guardar el ASCII
            convertirInt decimalProm, decimalConvertido
			jmp fin 
		  
        fin:
		   ret


	calcularPromedio endp

	
;************************** Procedimientos FIN ******************
    
;************************  MODO VIDEO INICIO ****************************
   
   
   
;************************  MODO VIDEO FIN ****************************	
    finaliza:
         close


main endp
end main



