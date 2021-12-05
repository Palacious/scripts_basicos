#!/bin/bash

cont=0

if [ $# -eq 1 2>/dev/null ] #Comprueba si se ha pasado un parámetro y descarta los posibles erroes.
then
    if [ -d $1 2>/dev/null ] #Comprueba si lo que se ha pasado como parámetro es un directorio y descarta los posibles errores.
    then
        for i in `ls $1` 
        do
            if [ -f $1/$i ] #Arregla el problema de que el script solo funcione en la carpeta local
            then
            cont=$((cont+1))
            fi
            
        done

        if [ $cont -gt 10 ] #Comprueba si realmente hay más de 10 ficheros
        then
            echo "Hay mas de 10 ficheros"
        else
            echo "Hay menos de 10 ficheros en $1"
        fi
    else
        echo "El parametro pasado no es un directorio"
    fi    


else
    echo "Falta el parámetro"
fi