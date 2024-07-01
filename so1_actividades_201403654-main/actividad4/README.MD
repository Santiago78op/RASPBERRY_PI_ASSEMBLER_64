# Actividad 4

## Creacion del script
Primero creamos el script para poder visualizar el saludo y decir la hora.

```sh
#!/bin/bash
echo "Hola usuario, el dia de hoy es $(date)"
```

## Creamos el archivo de configuracion del servicio

Se crea el archivo de configuracion del servicio en el directorio /etc/systemd/system/

```sh
#sudo nano /etc/systemd/system/saludo.service

[Unit]
Description=Saludo y la fecha actual

[Service]
Type=simple
ExecStart=/home/carlos/actividad4/script.sh

[Install]
WantedBy=multi-user.target
```

## Habilitamos el archivo del servicio
Despues que ya se creo el archivo lo habilitamos para que lo podamos utilizar.

```sh
#sudo systemctl enable saludo.service
#sudo systemctl start saludo.service

```
