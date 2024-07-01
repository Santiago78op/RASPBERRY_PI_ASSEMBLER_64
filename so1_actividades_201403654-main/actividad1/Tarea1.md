# Kernel

## ¿Que es un kernel?


El kernel  es una de las partes más fundamentales de un sistema operativo, este es el encargado de dar acceso al hardware de forma segura, y que todo software que lo necesita se le dará permiso. Se podría definir como una parte elemental e invisible del sistema operativo, pero muy importante ya que sin esta no podría funcionar el sistema. Todo sistema operativo que existe tiene un kernel desde los windows hasta el que es más popular en linux, este núcleo se ejecuta con todos los accesos y en especial a los recursos del sistema, para responder a todas las peticiones que le solite el software, además de gestionar el orden por el cual se reciben peticiones es como se responden estas.

## Tipos de Kernel

### Kernel Monolitico

Este tipo de kernel se caracteriza por que en si totalidad trabaja en el espacio del núcleo estando en modo supervisor, también tiene un conjunto primitivo de llamadas hacia el sistema que implementa todos los servicios del sistema operativo como lo es concurrencia, planificación de proceso, sistema de archivos entre otros. En esta arquitectura es como una relación entre el programa que tiene el sistema operativo y el núcleo del kernel entre sí. Tiene la característica de no ser modular y tiene un tamaño considerable, igualmente cada vez que se requiera agregar alguna nueva funcionalidad es necesario recompilar todo el kernel y reiniciarlo para que funcione correctamente.

### Microkernel

Este tipo de núcleo del sistema operativo provee un conjunto de primitivas o llamadas mínimas al sistema donde se requiere implementar estos servicios básicos como espacios de dirección y una planificación básica. Todos los demás servicios como gestión de memoria, sistemas de archivos entre otros que generalmente son provistos por el núcleo, se ejecutan como procesos en el espacio del usuario. Como algunos beneficios se argumenta que es tolerante a fallos y es mas portable entre distintas plataformas de hardware.

### Kernel Hibrido

En esencia es un micronúcleo pero que tiene algo de código que no es esencial en el espacio del núcleo, pero a su vez este se ejecute más rápidamente que si estuviera en el espacio del usuario, este fue determinado por varios desarrolladores de los inicios de los sistemas operativos que aplicaron esta arquitectura de micronúcleo, y se adoptó antes que se mostrará que estos pueden tener también un buen rendimiento.

#### Diferencias

| No. | Kernel Monolitico | Microkernel | Kernel Hibrido |
|-    | ----------------- | ----------- | -------------- |
| 1   | Si se realiza algún cambio es necesario recompilar todo el kernel. | Reducción de  la complejidad y descentralización de los fallos. | Rapidez en ejecución de código no esencial en espacio del núcleo. |
| 2   | Todos los componentes funcionales del grupo tienen acceso a todas las estructuras internas. | Facilidad para crear y depurar controladores de dispositivos. | Buen rendimiento en comparación de kernels completos. |
| 3   | Si existe un error se propaga como cascada en el sistema. |  Más tolerancia a fallos y portabilidad a otras plataformas de hardware. | Facilidad para agregar código que es necesario de ejecución más rápida al iniciar el ordenador. |

## User vs Kernel Mode

### Modo usuario

Siempre que se ejecuta un programa en el sistema operativo este es iniciado en modo usuario, entonces cuando este programa es necesario que se ejecute crea un proceso y espcio de direcciones virtuales. Este modo tiene muchos menos privilegios y no se le permite acceder directamente a recursos del sistema.

### Modo kernel

El kernel es el progrma centrarl en el cual se basan todos los elementos que componen el sistema operativo, se utiliza para acceder a los componenetes de hardwrare y programar que procesos se deben ejecutar y cuando, asi como la administracion de la intereacion entre hardare y el software de la aplicacion. Por ello este programa es el mas privilegiado a diferencia de los otros porgramas que interacturan con hardware directamente.


