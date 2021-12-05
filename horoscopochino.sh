#!/bin/bash

#Pido el año de nacimiento del usuario
read -p "Introduzca su año de nacimiento: " nacimiento

#Compruebo si el usuario realmente ha introducido un valor numérico.
if [ $nacimiento -ge 0 2>/dev/null ]
then
    #Calculo el resto de la división entre 12 del año que ha dado el usuario
    result=$((nacimiento%12))

    echo "Tu horóscopo chino es: "
    echo " "
    sleep 1

    #A partir del resto muestro con un case el horóscopo chino del usuario
    case $result in

    0) echo "El mono";;
    1) echo "El gallo";;
    2) echo "El perro";;
    3) echo "El cerdo";;
    4) echo "La rata";;
    5) echo "El buey";;
    6) echo "El tigre";;
    7) echo "El conejo";;
    8) echo "El dragón";;
    9) echo "La serpiente";;
    10) echo "El caballo";;
    11) echo "La cabra";;

    esac

#Si el usuario no ha introducido un dato válido se le informará mediante un mensaje de error.
else

echo "ERROR. Por favor introduzca una fecha válida."

fi