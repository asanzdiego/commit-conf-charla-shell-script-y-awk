#! /bin/bash

# script que saca un "Hola " + parámetros + "!" por pantalla
# y que verifica que hayamos introducido al menos un parámetro

NUMERO_DE_PARAMETROS=$#
if [ $NUMERO_DE_PARAMETROS -le 0 ]; then
    echo "Hay que introducir al menos un parámetro."
    exit 1
fi

TODOS_LOS_PARAMETROS=$@
echo "Hola $TODOS_LOS_PARAMETROS!"
