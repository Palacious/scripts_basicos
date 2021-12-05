#!/bin/bash

#Pido al usuario que introduzca un número.
read -p "Introduzca el número a comprobar: " numero

#Compruebo que el usuario ha introducido realmente un valor numérico. Descarto cualquier error.
if [ $numero -ge 0 2>/dev/null ]
then

    #Si el resto de la división entre 10 da 0 es que es múltiplo de 10.
    if [ $(($numero%10)) -eq 0 ]
    then
    echo "El número es múltiplo de 10"

    else
    echo "No es múltiplo de 10"
    fi

#Si el dato introducido por el usuario no es válido le devolverá un mensaje de error.
else

echo "ERROR. Por favor asegurese de introducir un dato numérico válido."

fi