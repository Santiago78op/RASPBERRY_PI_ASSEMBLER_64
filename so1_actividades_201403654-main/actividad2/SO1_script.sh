#!/bin/bash

export GITHUB_USER="CarlosV951"

date -d @`date +%s` '+%m/%d/%Y:%H:%M:%S'

mkdir /tmp/`date +%s`/

echo "Hola <CarlosV951>.User ID:<57165427>.Cuenta fue creada el: <2019-10-30T04:05:20Z>." >
 /tmp/1691168838/saludos.log

echo "Tarea cron"

*/5 * * * * carlos /tmp/SO1_script.sh