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





 ;Variable actuales
 swapped db 2 dup('$'), '$'
 endIndex dw 2 dup('$'), '$'
 currentIndex dw 2 dup('$'), '$'
 temp db 2 dup('$'), '$'
 tamanioArregloDecimal dw 2 dup('$'), '$' 
 contadorTamanio dw 2 dup('$'), '$' 
 indice  dw 2 dup('$'), '$' 
 indiceUnico  dw 2 dup('$'), '$' 


  


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
 
 decimalesReales db 1000 dup('z'), '}'
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


 pruebaMediana  db 0ah,0dh, 'Salio del ciclo' , '$'

;*******************Mensajes Error FIN*********************

;******************* MODO VIDEO INICIO ************************
  


;******************* MODO VIDEO FIN ***************************

;****************** Comandos para realizar comparacion *******************
  cprom db 'prom' , '$'
  mediana db 'mediana' , '$'
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
		mov decimalesReales[1],13d
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
		cmp al, 1
		je opcion2
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

    opcion2:
		;Verificamos que estan desordenados los numeros
		print saltolinea
		CALL recovertirDecimalesReales
		print decimalesConvertidos
		print saltolinea

		;Ordenamiento Ascendente burbuja → (Tambien esta el ordenamiento Descendente burbuja)
		CALL ordenamientoAscendente
        print saltolinea

		;Llamamos al metodo para convertir la matriz decimalesReales a ASCII y poder mostrarlos (El procedimiento solo funciona con esta variable)
		CALL recovertirDecimalesReales

		;Verificamos que si haya ordenado
		print saltolinea
		print decimalesConvertidos
		print saltolinea

		;Limpiamos las variables
		limpiar decimalProm,30,36
        limpiar decimalConvertido,10,36

		;Ahora que ya tienen ordenada la lista para calcular la mediana es mas accesible
		;Si se les complica como lo trabaje 0,N,0,N,0,N lo que pueden hacer es recorrer la matriz y copiar en la matriz temporal
		;array1[0] = array2[1]
		;array1[1] = array2[1+2]
		;array1[2] = array2[1+4]...

		;De ahi el calculo de la mediana en base al documento del enunciado sale




	    jmp menu

	opcion3:
		;Sugerencia
		;Para el calculo de la moda primero creen un procedimiento o macro que calcule cuantos elementos se repiten.
		;Eso lo guardan en un arreglo algo asi: {10,5,2,25,4,6,5,1}
		;Este arreglo seria algo asi: Frecuencia 10 de 5,Frecuencia 2 de 25,Frecuencia 4 de 6,Frecuencia 5 de 1
		;Para este caso es que se utiliza la matriz de decimales reales que tiene la estructura de {0,N,0,N,0,N}
		;Solo recorren la matriz y en la posicion n-1 aumentan su contador en + 1 cada vez que aparece el numero.
		;De una vez tengan todo ordenado solamente recorren la lista y cada vez que encuentren uno con frecuencia mayor lo sustituyen y asi sucesivamente.
		;Cuando ya tengan el valor solo verifican como convertir ese numero a ascii en promedio esta solucion solo verifiquen como funciona.
		jmp menu

	opcion4:
		;Sugerencia
		;Ya que tienen ordenado los datos de forma descendente el primer valor que encuentren es el maximo.

		jmp menu

	opcion5:
		;Sugerencia
		;Ya que tienen ordenado los datos de forma ascendente el primer valor que encuentren es el minimo.

		jmp menu

	opcion6:
		;Sugerencia
		;Si se ponen pilas en el proceso de ordenamiento esta el indice unico que guarda el numero de elementos ;)
		jmp menu

	opcion7:
		;Sugerencia
		;Para la grafica si son muchas las opciones para realizarla, yo les recomiendo hacer primero como que los carteles de frecuencia
		;Luego ya pueden hacer las barras
		;Comiencen a graficar una matriz sencilla de frecuencia 1 por ejemplo, y despues solo una barra con frecuencias 2 y asi sucesivamente
		;De esa manera cuando ya tengan una barra funcionando correctamente solo es ctrl + c en el resto de barras faltantes.

		;Ahora el ordenamiento de las frecuencias les recomiendo por ejemplo lo siguiente:
		;Ordenen de manera ascendente los datos de forma que los datos quedan ordenados asi: {1,1,1,1,2,2,2,4,4,88,88}
		;Despues extragan solo los valores unicos dejando un espacio de por medio asi: {0,1,0,2,0,4,0,88}
		;Despues hagan lo mismo que hicieron en la moda, como ya estan ordenados ya los pueden imprimir segun su orden: {4,1,3,2,2,4,2,88} 

		jmp menu

	opcion8:
		;Sugerencia
		;Para la grafica si son muchas las opciones para realizarla, yo les recomiendo hacer primero como que los carteles de frecuencia
		;Luego ya pueden hacer las barras
		;Comiencen a graficar una matriz sencilla de frecuencia 1 por ejemplo, y despues solo una barra con frecuencias 2 y asi sucesivamente
		;De esa manera cuando ya tengan una barra funcionando correctamente solo es ctrl + c en el resto de barras faltantes.

		;Ahora el ordenamiento de las frecuencias les recomiendo por ejemplo lo siguiente:
		;Ordenen de manera descendente los datos de forma que los datos quedan ordenados asi: {88,88,4,4,2,2,2,1,1,1,1}
		;Despues extragan solo los valores unicos dejando un espacio de por medio asi: {0,88,0,4,0,2,0,1}
		;Despues hagan lo mismo que hicieron en la moda, como ya estan ordenados ya los pueden imprimir segun su orden: {2,88,2,4,3,2,4,1} 
		jmp menu

	opcion9:
		;Sugerencia 
		;Tambien les recomiendo primero hacer la grafica de barras dado que en esta se reutilizan varios componentes.
		;Para la grafica de lineas pueden utilizar la pendiente primero para saber si es positiva o negativa.
		;Si es positiva a ascendente si es negativa va descendente, o si es 0 es una recta
		;Ahora segun sea positiva o negativa pueden ya sea calcular los puntos por donde pasa la recta ya que tienen la pendiente
		;O bien puede trabajar por sectores por ejemplo saben bien la separacion de cada espacio es fijo en "X" entonces lo variable es la 
		;altura que puede tomar la linea, entonces dividen cuantos pixeles se necesitan para llegar a la altura deseada en el desplazamiento de "X"
		;Puede ser complicado de plantear, pero queda a creatividad de ustedes como resolver el problema, pero si aplican trigonometria o mate basica
		;pueden resolver el problema

		jmp menu

	opcion10:
		;Sugerencia
		;Cargen el archivo a una variable buffer
		;Despues vayan recorriendo el buffer caracter a caracter hasta que encuentren una coma,
		;para el ejemplo del numero 19 tienen en ascii un 1 y un 9, le restan 48 a ambos
		;Ahora para el primer numero lo multiplican * 10 y le suman el segundo y ya tienen un numero decimal 19
		;En caso de solo encontrar un solo numero solo le restan 48 y lo guardan.

		jmp menu

	opcion11:
		;Sugerencia
		;En macros anteriores creo que esta una macro limpiar solo imprime varios saltos de linea en si.

		jmp menu

	opcion12:
		;Sugerencia
		;Para el reporte pueden utilizar lo mismo que hicieron en la practica 1 y 2 solo que en vez de concatenar html
		;Concatenan a un txt mas sencillo que el html.
		;Ahi esta el ejemplo de clases anteriores.

		jmp menu

	opcion13:
		;Aqui solo denle print su informacion puntos faciles


		jmp menu
	opcion14:

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

	
	ordenamientoAscendente proc
		limpiarTodo

		inicio:
			mov swapped[0],1
			mov contadorTamanio[0],0
			mov indice[0],1
			mov indiceUnico[0],0

			;Calcular el tamaño del arreglo
        calcularTamanio:
		    mov bx, indice[0]
			mov si, bx
			mov al, decimalesReales[si]

			cmp al, 122
			je termino

			jmp aumentoVariables

		aumentoVariables:
			inc si
			inc si
			mov bx, si
			mov indice[0],bx

            ;Para que vaya contando los elementos
			xor bx,bx
			mov bx,indiceUnico[0]
			add bx, 1
			mov indiceUnico[0],bx
          
			jmp calcularTamanio

		termino:
            xor bx, bx
			;mov bx, indiceUnico[0]
			;ADD bx, 48
			;mov indiceUnico[0],bx
			;print indiceUnico
			;print saltolinea
			jmp continuar

		continuar:
		    xor bx,bx
			mov bx, indiceUnico[0]
			SUB BX, 1
			mov endIndex[0], BX

		    xor ax,ax
            mov al, swapped[0]
			cmp al, 1
			je while1
			

			;print pruebaMediana

			jmp salirOrdenamiento

		while1:
			;print pruebaMediana
			mov swapped[0],0
			mov currentIndex[0],0

		valicionWhile:
			xor ax,ax
			xor bx,bx
			mov ax, currentIndex[0]
			mov bx, endIndex[0]

			cmp ax, bx
			jb while2


			xor bx,bx
			mov bx, endIndex[0]
			sub bx, 1
			mov endIndex[0],bx
			jmp continuar

		while2:
			
			
		validacionIF:
			xor di,di
			xor si,si
			xor bx,bx
			xor ax,ax
			xor cx,cx
			mov bx,currentIndex[0]
			
			;((n+1)2)-1
			add bx,1
			mov ax,bx
			xor bx,bx
			mov bx, 2
			mul bx
			SUB ax, 1
			mov si,ax
			xor bx,bx
			xor ax,ax
			mov bl, decimalesReales[si]
			mov al, decimalesReales[si+2]

			;print pruebaMediana

			cmp bx,ax
			ja continuarIF

		noValidoIf:
			;Aumentamos currentIndex
			xor ax,ax
			mov ax, currentIndex[0]
			add ax, 1
			mov currentIndex[0], ax

			;print saltolinea
			;print currentIndex
			;print saltolinea

			jmp valicionWhile


		continuarIF:
			xor bx,bx
			xor ax,ax
			xor cx,cx
			mov bx,currentIndex[0]
			
			;((n+1)2)-1
			add bx,1
			mov ax,bx
			xor bx,bx
			mov bx, 2
			mul bx
			SUB ax, 1
			mov si,ax
			xor bx,bx
			xor ax,ax
			;let temp = arr[currentIndex];
			mov al, decimalesReales[si]
			mov temp[0], al
			;arr[currentIndex] = arr[currentIndex + 1];
			mov bl, decimalesReales[si + 2]
			mov decimalesReales[si], bl
			;arr[currentIndex+1] = temp;
			xor ax,ax
			mov al, temp[0]
			mov decimalesReales[si + 2],al

			mov swapped[0],1


			jmp noValidoIf


		salirOrdenamiento:
			ret


	ordenamientoAscendente endp


	ordenamientoDescendente proc
		limpiarTodo

		inicio:
			mov swapped[0],1
			mov contadorTamanio[0],0
			mov indice[0],1
			mov indiceUnico[0],0

			;Calcular el tamaño del arreglo
        calcularTamanio:
		    mov bx, indice[0]
			mov si, bx
			mov al, decimalesReales[si]

			cmp al, 122
			je termino

			jmp aumentoVariables

		aumentoVariables:
			inc si
			inc si
			mov bx, si
			mov indice[0],bx

            ;Para que vaya contando los elementos
			xor bx,bx
			mov bx,indiceUnico[0]
			add bx, 1
			mov indiceUnico[0],bx
          
			jmp calcularTamanio

		termino:
            xor bx, bx
			;mov bx, indiceUnico[0]
			;ADD bx, 48
			;mov indiceUnico[0],bx
			;print indiceUnico
			;print saltolinea
			jmp continuar

		continuar:
		    xor bx,bx
			mov bx, indiceUnico[0]
			SUB BX, 1
			mov endIndex[0], BX

		    xor ax,ax
            mov al, swapped[0]
			cmp al, 1
			je while1
			

			;print pruebaMediana

			jmp salirOrdenamiento

		while1:
			;print pruebaMediana
			mov swapped[0],0
			mov currentIndex[0],0

		valicionWhile:
			xor ax,ax
			xor bx,bx
			mov ax, currentIndex[0]
			mov bx, endIndex[0]

			cmp ax, bx
			jb while2


			xor bx,bx
			mov bx, endIndex[0]
			sub bx, 1
			mov endIndex[0],bx
			jmp continuar

		while2:
			
			
		validacionIF:
			xor di,di
			xor si,si
			xor bx,bx
			xor ax,ax
			xor cx,cx
			mov bx,currentIndex[0]
			
			;((n+1)2)-1
			add bx,1
			mov ax,bx
			xor bx,bx
			mov bx, 2
			mul bx
			SUB ax, 1
			mov si,ax
			xor bx,bx
			xor ax,ax
			mov bl, decimalesReales[si]
			mov al, decimalesReales[si+2]

			;print pruebaMediana

			cmp bx,ax
			jb continuarIF

		noValidoIf:
			;Aumentamos currentIndex
			xor ax,ax
			mov ax, currentIndex[0]
			add ax, 1
			mov currentIndex[0], ax

			;print saltolinea
			;print currentIndex
			;print saltolinea

			jmp valicionWhile


		continuarIF:
			xor bx,bx
			xor ax,ax
			xor cx,cx
			mov bx,currentIndex[0]
			
			;((n+1)2)-1
			add bx,1
			mov ax,bx
			xor bx,bx
			mov bx, 2
			mul bx
			SUB ax, 1
			mov si,ax
			xor bx,bx
			xor ax,ax
			;let temp = arr[currentIndex];
			mov al, decimalesReales[si]
			mov temp[0], al
			;arr[currentIndex] = arr[currentIndex + 1];
			mov bl, decimalesReales[si + 2]
			mov decimalesReales[si], bl
			;arr[currentIndex+1] = temp;
			xor ax,ax
			mov al, temp[0]
			mov decimalesReales[si + 2],al

			mov swapped[0],1


			jmp noValidoIf


		salirOrdenamiento:
			ret


	ordenamientoDescendente endp
	
;************************** Procedimientos FIN ******************
    
;************************  MODO VIDEO INICIO ****************************
   
   
   
;************************  MODO VIDEO FIN ****************************	
    finaliza:
         close


main endp
end main



