# Actividad 3 - Gestión de Permisos
Crear un md file y resolver cada uno de los items solicitados a continuación. Debe de colocar el comando utilizado asi como el resultado de este si es necesario. 

## Gestión de Usuarios

### Creación de Usuarios
Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.
| Comando | Salida |
| ------- | ------ |
| sudo useradd usuario1 | - |
| sudo useradd usuario2 | - |
| sudo useradd usuario3 | - |

### Asignación de Contraseñas
Establece una nueva contraseñas para cada usuario creado.
| Comando | Salida |
| ------- | ------ |
| sudo passwd usuario1 | Nueva contraseña:  <br> Vuelva a escribir la nueva contraseña:  <br> passwd: contraseña actualizada correctamente <br> |
| sudo passwd usuario2 | Nueva contraseña:  <br> Vuelva a escribir la nueva contraseña:  <br> passwd: contraseña actualizada correctamente <br> |
| sudo passwd usuario3 | Nueva contraseña:  <br> Vuelva a escribir la nueva contraseña:  <br> passwd: contraseña actualizada correctamente <br> |

### Información de Usuarios
Muestra la información de `usuario1` usando el comando `id`
| Comando | Salida |
| ------- | ------ |
| id usuario1 | uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1) |
| id usuario2 | uid=1002(usuario1) gid=1002(usuario2) grupos=1002(usuario2) |
| id usuario3 | uid=1003(usuario1) gid=1003(usuario3) grupos=1003(usuario3) |

### Eliminación de Usuarios
Elimina `usuario3`, pero conserva su directorio principal.
| Comando | Salida |
| ------- | ------ |
| sudo userdel usuario3 | - |

## Gestión de Grupos

### Creación de Grupos
Crea dos grupos llamados `grupo1` y `grupo2`.
| Comando | Salida |
| ------- | ------ |
| sudo groupadd grupo1 | - |
| sudo groupadd grupo2 | - |

### Agregar Usuarios a Grupos
Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.
| Comando | Salida |
| ------- | ------ |
| sudo usermod -a -G grupo1 usuario1 | - |
| sudo usermod -a -G grupo2 usuario2 | - |

### Verificar Membresía
Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.
| Comando | Salida |
| ------- | ------ |
| groups usuario1 | usuario1 : usuario1 grupo1 |
| groups usuario2 | usuario2 : usuario2 grupo2 |

### Eliminar Grupo
Elimina `grupo2`.
| Comando | Salida |
| ------- | ------ |
| sudo groupdel usuario1 | - |

## Gestión de Permisos


### Creación de Archivos y Directorios
* Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
* Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

| Comando | Salida |
| ------- | ------ |
| cd /home/usuario1 | - |
| su usuario1 | - |
| echo "Hola mundo" > archivo1.txt | - |
| mkdir directorio1 | - |
| cd directorio1 | - |
| echo " " > archivo2.txt | - |

### Verificar Permisos
Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.
| Comando | Salida |
| ------- | ------ |
| ls -l | total 8 <br> -rw-rw-r-- 1 usuario1 usuario1   11 ago  9 18:43 archivo1.txt <br>drwxrwxr-x 2 usuario1 usuario1 4096 ago  9 18:43 directorio1 <br> |

### Modificar Permisos usando `chmod` con Modo Numérico
Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.
| Comando | Salida |
| ------- | ------ |
| chmod 640 archivo1.txt | - |

### Modificar Permisos usando `chmod` con Modo Simbólico
Agrega permiso de ejecución al propietario del `archivo2.txt`.
| Comando | Salida |
| ------- | ------ |
| chmod +rwx archivo2.txt | - |

### Cambiar el Grupo Propietario
Cambia el grupo propietario de `archivo2.txt` a `grupo1`.
| Comando | Salida |
| ------- | ------ |
| chgrp grupo1 archivo2.txt | - |

### Configurar Permisos de Directorio
Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.
| Comando | Salida |
| ------- | ------ |
| chmod 740 directorio1 | - |

### Comprobación de Acceso
Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.
| Comando | Salida |
| ------- | ------ |
| su usuario2 | - |
| cat archivo1.txt | cat: archivo1.txt: Permiso denegado |
| cd directorio1 | sh: 6: cd: can't cd to directorio1 |

### Verificación Final
Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.
| Comando | Salida |
| ------- | ------ |
| ls -l | -rw-r----- 1 usuario1 usuario1   11 ago  9 18:43 archivo1.txt <br> drwxr----- 2 usuario1 usuario1 4096 ago  9 18:43 directorio1 <br> |
| ls -id | 2916530 . |






