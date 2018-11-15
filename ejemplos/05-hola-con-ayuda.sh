#! /bin/bash

# script que saca un "Hola " + parámetros + "!" por pantalla
# separando cada parámetro con una coma (,)
# que verifica que hayamos introducido al menos un parámetro
# y que muestra una ayuda en caso de error

# función de ayuda
function ayuda() {
cat << DESCRPCION_AYUDA
SYNOPSIS
    $0 NOMBRE_1 [NOMBRE_2] ... [NOMBRE_N]

DESCRIPCION
    Muestra "Hola NOMBRE_1, NOMBRE_2, ... NOMBRE_N!" por pantalla.

CÓDIGOS DE RETORNO
    1 Si el número de parámetros es menor que 1

DESCRPCION_AYUDA
}

NUMERO_DE_PARAMETROS=$#
if [ $NUMERO_DE_PARAMETROS -le 0 ]; then
    echo "Hay que introducir al menos un parámetro."
    ayuda
    exit 1
fi

MENSAJE="Hola"
ES_PRIMERO=1
PRIMER_PARAMETRO=$1

# mientras haya parámetros
while [ -n "$PRIMER_PARAMETRO" ]; do

    if [ $ES_PRIMERO -eq 1 ]; then
        MENSAJE="$MENSAJE $PRIMER_PARAMETRO"
        ES_PRIMERO=0
    else
        MENSAJE="$MENSAJE, $PRIMER_PARAMETRO"
    fi

    # pasamos al siguiente parámetro
    shift
    PRIMER_PARAMETRO=$1
done

# mostramos la salida por pantalla
echo $MENSAJE"!"

exit 0
