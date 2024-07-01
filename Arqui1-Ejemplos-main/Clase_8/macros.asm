print macro cadena ;imprimir cadenas
   mov ah,09h ;Numero de funcion para imprimir cadena en pantalla
	mov dx, @data ;con esto le decimos que nuestrfo dato se encuentra en la sección data
	mov ds,dx ;el ds debe apuntar al segmento donde se encuentra la cadena (osea el dx, que apunta  a data)
	mov dx,offset cadena ;especificamos el largo de la cadena, con la instrucción offset
	int 21h  ;ejecutamos la interrupción
endm 

getChar macro ;obtener caracter
    mov ah,01h ;se guarda en al en código hexadecimal del caracter leído 
    int 21h
endm

ObtenerTexto macro cadena ;macro para recibir una cadena, varios caracteres 
 LOCAL ObtenerChar, endTexto 
 ;si, cx, di  registros que usualmente se usan como contadores 
    xor di,di  ; => mov si, 0  reinica el contador

    ObtenerChar:
        getChar  ;llamamos al método de obtener caracter 
        cmp al, 0dh ; como se guarda en al, comparo si al es igual a salto de línea, ascii de salto de linea en hexadecimal o 10en ascii
        je endTexto ;si es igual que el salto de línea, nos vamos a la etiqueta endTexto, donde agregamos el $ de dolar a la entrada 
        mov cadena[di],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc di ; => si = si+1
        jmp ObtenerChar

    endTexto:
        mov al, 36 ;ascii del signo $ o en hexadecimal 24h
        mov cadena[di],al  ;copiamos el $ a la cadena
endm 

clear macro ;limpia pantalla
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea
         print saltolinea

endm

close macro  ;cerrar el programa
    mov ah, 4ch ;Numero de función que finaliza el programa
    xor al,al ;limpiar al 
    int 21h
endm

convertirMayuscula macro cadena
 LOCAL recorrer,mayuscula,minuscula,fin
     mov si,0
     recorrer:
        mov al,cadena[si]
        cmp al,96  ;la letra esta en mayuscula
        ja mayuscula
        cmp al, 36
        je fin
        cmp al, 91
        jb minuscula
        
    mayuscula:
        ;actualizamos el valor de la posicion
        mov al, cadena[si] ;confirmamos que al tenga el valor
        sub al, 32          ;restamos el valor de mayuscula
        mov cadena[si], al ;guardamos
        inc si 
        jmp recorrer
        
    minuscula:
        ;Si es mayuscula o numero solo incrementamos si y volvemos
        inc si 
        jmp recorrer

    fin:

endm

compararLexema macro lexema1,lexema2, resultado
 LOCAL comparar,ok,malo,fin  
       ;convertimos mayuscula los lexemas para que no importe si esta en mayuscula o miniscula.
       convertirMayuscula lexema1
       convertirMayuscula lexema2
       ;limpiamos resultado valores
       mov resultado[0] ,48
       mov si,0
      
       
       comparar:
           ;asignamos
            mov al, lexema1[si]
            mov bl, lexema2[si]

            cmp al,bl
            je ok
            cmp al,bl
            jne malo
       ok:
          ;coloco true en resultado
          mov resultado[0],49
          ;Verificamos el valor de salida  
          cmp al,36
          je fin   

          inc si
          jmp comparar


       malo:
          mov resultado[0],48
          jmp fin

       fin:
          
       


endm

ingresarComando macro
 LOCAL inicio,opcionCprom,opcionSalir,fin

      inicio:
            limpiarTodo
            limpiar comando, 50,36 
            limpiar numeroOpcion,2,36
            ObtenerTexto comando
            ;Ahora comparamos el texto comando a comando parametro1=Comando comparar, parametro2=comando ingresado, parametro3,resultado aceptado o negado 1 en ascii o 0 en ascii
            compararLexema cprom, comando, resultadoLexema
            mov al, resultadoLexema[0]
            cmp al, 49
            je opcionCprom
            ;Ahora comparamos el texto comando a comando parametro1=Comando comparar, parametro2=comando ingresado, parametro3,resultado aceptado o negado 1 en ascii o 0 en ascii
            compararLexema salir, comando, resultadoLexema
            mov al, resultadoLexema[0]
            cmp al, 49
            je opcionSalir
            ;Ahora comparamos el texto comando a comando parametro1=Comando comparar, parametro2=comando ingresado, parametro3,resultado aceptado o negado 1 en ascii o 0 en ascii
            compararLexema mediana, comando, resultadoLexema
            mov al, resultadoLexema[0]
            cmp al, 49
            je opcionMediana

            jmp fin
            

      opcionCprom:
            mov numeroOpcion[0],0
            jmp fin
      
      opcionMediana:
            mov numeroOpcion[0],1
            jmp fin
      
      opcionSalir:
            mov numeroOpcion[0],13
            jmp fin

      fin:
endm

comandoAbrir macro resultadoLexema
 LOCAL Inicio,concatenarNombre,incorrecto,fin
      xor si,si  
      xor di,di 
      mov resultadoLexema[0], 48
      Inicio:
         mov al, comando[si]
         cmp al, 60
         je concatenarNombre

         cmp al, 36
         je incorrecto
         inc si
         jmp Inicio 

      concatenarNombre:
         inc si 
         mov al, comando[si]

         cmp al, 62
         je fin

         cmp al, 36
         je incorrecto 

         mov archivoNombre[di], al
         inc di 

         mov resultadoLexema[0], 49

         jmp concatenarNombre 

      incorrecto:
         mov resultadoLexema[0], 48
         jmp fin 

      fin:
         


endm

limpiarTodo macro
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx 
    xor si, si
    xor di, di

endm

tamanioArreglo2 macro arreglo
 LOCAL mientras,fin
    mov si,0
    xor bx, bx
    mientras:
         mov ah, arreglo[si]
         cmp ah, 122
         je fin
         add bx,1
         inc si
         inc si 
         jmp mientras
    fin:
         mov tamanio2[0], bh
         mov tamanio2[1], bl

endm

esNumero macro numero,verificador
 LOCAL fin,esNumber,falso
     mov al,numero
     
     cmp al, 48
     je esNumber
     cmp al, 49
     je esNumber
     cmp al, 50
     je esNumber
     cmp al, 51
     je esNumber
     cmp al, 52
     je esNumber
     cmp al, 53
     je esNumber
     cmp al, 54
     je esNumber
     cmp al, 55
     je esNumber
     cmp al, 56
     je esNumber
     cmp al, 57
     je esNumber

    jmp falso
    esNumber:
       mov verificador[0], 1
       jmp fin 

    falso:
       mov verificador[0], 0
       jmp fin 
    fin:
endm

;en el macro limpiar vamos a limpiar el arreglo con $
limpiar macro buffer, numbytes, caracter
 LOCAL Repetir
	xor si,si ; colocamos en 0 el contador si
	xor cx,cx ; colocamos en 0 el contador cx
	mov	cx,numbytes ;le pasamos a cx el tamaño del arreglo a limpiar 

	Repetir:
		mov buffer[si], caracter ;le asigno el caracter que le estoy mandando 
		inc si ;incremento si
		Loop Repetir ;se va a repetir hasta que cx sea 0 
endm

convertirInt macro numero, almacenar
 LOCAL parteEntera,InicioConver,Mientras,temporal,agregar,zero,fin 
      limpiarTodo
      mov agregarPunto[0], 0

      parteEntera: 
		   xor ax, ax 
         mov ah, numero[si]
			inc si

			;Fin de cadena
			cmp ah, 122
			je fin
           
		   ;Si no, que siga reconvirtiendo
         mov al, numero[si]
			inc si

			mov contador1[0], 0
			mov contador2[0], 0 

         cmp ax, 0
			je zero 


		   jmp InicioConver

		InicioConver:
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

			jmp InicioConver

		Mientras:
			;condicion de salida
			xor ax,ax
			xor bx,bx
			mov al, contador1[0]
			mov bl, contador2[0]
			cmp al, bl
			je temporal


			pop bx 
			mov almacenar[di],bl
			inc di

         xor bx, bx
			mov bl, contador2[0]
			add bl, 1
			mov contador2[0], bl

			jmp Mientras

		temporal:
		    mov contador1[0], 0
		    mov contador2[0], 0

         xor ax, ax
		   ;Agregar punto?
         mov al, agregarPunto[0]
			cmp al, 0
			je agregar

			jmp parteEntera  

		agregar:
		   mov agregarPunto[0],1
		   mov almacenar[di],46
			inc di 
			jmp parteEntera  

      zero: 
		   ;agregar cero
         mov almacenar[di], 48
			inc di 
			jmp parteEntera 

      fin:
endm









