#! /bin/bash

# script que saca un información de los parámetros
# y que verifica que hayamos introducido al menos un parámetro

num_params=$#

if [[ $num_params -lt 1 ]]; then
    echo "Hay que introducir al menos un parámetro."
    exit 1 # salir con un código de retorno > 0
fi

# Valores por defecto
default_3="Conf"

# Asignación
param_1=$1
param_2=${2:-Commit}
param_3=${3:-${default_3}}
all_params=($@) #asignar como array

echo "param_1=${param_1}"
echo "param_2=${param_2}"
echo "param_3=${param_3}"
echo "all_params=${all_params[*]}" # expandir array