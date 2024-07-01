
print macro cadena ;imprimir cadenas
    mov ah,09h ;Numero de funcion para imprimir cadena en pantalla
	mov dx, @data ;con esto le decimos que nuestrfo dato se encuentra en la sección data
	mov ds,dx ;el ds debe apuntar al segmento donde se encuentra la cadena (osea el dx, que apunta  a data)
	mov dx,offset cadena ;especificamos el largo de la cadena, con la instrucción offset
	int 21h  ;ejecutamos la interrupción
endm 

close macro  ;cerrar el programa
    mov ah, 4ch ;Numero de función que finaliza el programa
    xor al,al ;limpiar al 
    int 21h
endm

getChar macro ;obtener caracter
    mov ah,01h ;se guarda en al en código hexadecimal del caracter leído 
    int 21h
endm

incremetarSI macro repeticion
LOCAL Repetir
    xor cx,cx
    
	
    ;Multiplicamos el numero de columna por 2 para caer en la posicion que queriamos
    xor ax,ax
    xor bx,bx
    mov ax, repeticion ;Multiplicacion del primer numero
    mov bx, 2          ;Multiplicacion del segundo numero
    mul bx

    ;Guardamos el resultado en cx
    ;Cargamos el numero de repeticiones que queremos que realice loop
    mov cx, ax


	Repetir:
        ;Incrementamos SI
        inc si
        ;Repetimos se va a repetir en base al numero que tenga cx, en este caso lo que se ingrese
        ;por el valor de repeticiones
		Loop Repetir

    ;Correcion de desfase
    inc si
    inc si

    xor cx,cx
    xor ax,ax
    xor bx,bx
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
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
endm

imprimirDecimal macro numero,guardar
    mov al, numero     
    aam               
    add ax, 3030h     
    push ax            
    mov dl, ah         
    mov guardar[0], dl
    mov ah, 02h        
    ;int 21h
    pop dx             
    mov al,dl
    mov guardar[1], al
    mov ah, 02h        
    ;int 21h
endm

obtenerTiempo macro
 LOCAL menorA,mayorA,verificarMinutos,menorAM,mayorAM,verificarSegundos,menorAS,mayorAS,fin
   xor ax,ax
   xor bx,bx
   xor cx,cx
   xor dx,dx 

   mov ah,2Ch ;Numero de funcion para obtener fecha
	int 21h  ;ejecutamos la interrupción

   ;Extraemos los datos
   ;CH horas
   ;CL Minutos
   ;DH segundos
   mov al, ch
   cmp al, 10
   jb menorA
   jmp mayorA

   menorA:
      mov tiempoRealASCII[0], 48
      add al, 48
      mov tiempoRealASCII[1], al
      mov tiempoRealASCII[2], 58
      jmp verificarMinutos

   mayorA:
       mov temporalTiempoReal, al
       imprimirDecimal temporalTiempoReal,temporalTiempoRealASCII
       mov al, temporalTiempoRealASCII[0]
       mov tiempoRealASCII[0], al
       mov al, temporalTiempoRealASCII[1]
       mov tiempoRealASCII[1], al
       mov tiempoRealASCII[2], 58
       jmp verificarMinutos
      
   verificarMinutos:
      xor ax,ax
      xor bx,bx
      xor cx,cx
      xor dx,dx 

      mov ah,2Ch ;Numero de funcion para obtener fecha
      int 21h  ;ejecutamos la interrupción

      mov al, cl
      cmp al, 10
      jb menorAM
      jmp mayorAM

   menorAM:
      mov tiempoRealASCII[3], 48
      add al, 48
      mov tiempoRealASCII[4], al
      mov tiempoRealASCII[5], 58
      jmp verificarSegundos
   mayorAM:
      mov temporalTiempoReal, al
      imprimirDecimal temporalTiempoReal,temporalTiempoRealASCII
      mov al, temporalTiempoRealASCII[0]
      mov tiempoRealASCII[3], al
      mov al, temporalTiempoRealASCII[1]
      mov tiempoRealASCII[4], al
      mov tiempoRealASCII[5], 58
      jmp verificarSegundos

   verificarSegundos:
      xor ax,ax
      xor bx,bx
      xor cx,cx
      xor dx,dx 

      mov ah,2Ch ;Numero de funcion para obtener fecha
      int 21h  ;ejecutamos la interrupción

      mov al, dh
      cmp al, 10
      jb menorAS
      jmp mayorAS

   menorAS:
      mov tiempoRealASCII[6], 48
      add al, 48
      mov tiempoRealASCII[7], al
      mov tiempoRealASCII[8], 36
      jmp fin
   mayorAS:
      mov temporalTiempoReal, al
      imprimirDecimal temporalTiempoReal,temporalTiempoRealASCII
      mov al, temporalTiempoRealASCII[0]
      mov tiempoRealASCII[6], al
      mov al, temporalTiempoRealASCII[1]
      mov tiempoRealASCII[7], al
      mov tiempoRealASCII[8], 36
      jmp fin   

   fin:

    
endm

cronometrar macro
 LOCAL VerificarAumentar,aumentar,reiniciar,mostrar,fin
    mov al, segundos[0]
    cmp al,59
    jb VerificarAumentar
    
    jmp reiniciar

    VerificarAumentar:
         ;Verificamos si debemos o no aumentar
         jmp aumentar

    aumentar:
         ;Aumentamos en uno
         add al,1
         mov segundos[0],al
         jmp mostrar

    reiniciar:
         mov segundos[0],0
         mov al, minutos[0]
         add al, 1
         mov minutos[0],al
         jmp mostrar

    mostrar:
         mov al, minutos[0]
         mov temporalTiempo, al
         ;convertimos minutos
         imprimirDecimal  temporalTiempo, minutosASCII
         mov al, segundos[0]
         mov temporalTiempo, al
         ;convertimos minutos
         imprimirDecimal  temporalTiempo, segundosASCII
         ;ACTUALIZAMOS EL CRONOMETRO
         mov al, minutosASCII[0]
         mov cronometro[0], al
         mov al, minutosASCII[1]
         mov cronometro[1], al
         mov al, segundosASCII[0]
         mov cronometro[2], 58
         mov cronometro[3], al
         mov al, segundosASCII[1]
         mov cronometro[4], al


         jmp fin

    fin:
        

    

     



endm

concatenarCadena macro origen,destino,indiceEscritura
;xor si,si  ; => mov si, 0  reinica el contador
LOCAL ObtenerCaracter,  termino
    
    mov si,0
    pop si


    ObtenerCaracter:
        cmp origen[di], 36
        je termino
        mov al, origen[di]
        mov destino[si], al
        inc si
        inc di
        jmp ObtenerCaracter 
    termino:
        push si
        mov di,0
        
endm

limpiar macro buffer, numbytes, caracter
LOCAL Repetir
	xor si,si
	xor cx,cx
	mov	cx,numbytes

	Repetir:
		mov buffer[si], caracter
		inc si
		Loop Repetir
endm

crear macro name, handler
	
	mov ah,3ch ;función para crear fichero
	mov cx,00h ;fichero normal 
	mov dx, offset name ;carga la dirección de la variable buffer a dx
    mov ah, 3ch
	int 21h
	;jc Error4
	mov handler, ax ;sino hubo error nos devuelve el handler 

endm

cerrar macro handler
	
	mov ah,3eh
	mov bx, handler
	int 21h
	jc Error2
	mov handler,ax

endm

escribir macro handler, reporte, numbytes
    mov ah, 40h
	mov bx, handler
	mov cx, numbytes
	mov dx, offset reporte
	int 21h
	

endm