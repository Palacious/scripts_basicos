#!/bin/bash

#Pide a los 3 usuarios que introduzcan por teclado su altura en centímetros.
read -p "Introduzca su altura (En centímetros) de USUARIO 1: " altura1
read -p "Introduzca su altura (En centímetros) de USUARIO 2: " altura2
read -p "Introduzca su altura (En centímetros) de USUARIO 3: " altura3


#Compruebo si lo que estoy recogiendo por teclado realmente son datos numéricos y descarto los posibles errores.
if [ $altura1 -ge 0 2>/dev/null ] && [ $altura2 -ge 0 2>/dev/null ] && [ $altura3 -ge 0 2>/dev/null ]
then

#Comprueba si el usuario 1 es mas alto que los otros dos.
if [ $altura1 -gt $altura2 ] && [ $altura1 -gt $altura3 ]
then

    #Almaceno en esta variable los metros SIN DECIMALES.
    metro=$(($altura1/100))
    #Almaceno en esta variable los decimales de los metros.
    resto=$(($altura1%100))

    #En el resultado mostraré los metros junto a sus decimales.
    echo USUARIO 1 es el mas alto con una altura de: $metro,$resto metros.

#Comprueba si el usuario 2 es mas alto que los otros dos, realizando el mismo proceso que en el resto.
elif [ $altura2 -gt $altura1 ] && [ $altura2 -gt $altura3 ]
then

    metro=$(($altura2/100))
    resto=$(($altura2%100))
    echo USUARIO 2 es el mas alto con una altura de: $metro,$resto metros.
#Si ninguno de los otros dos es mas alto, entonces solo puede ser el tercero.
else
    metro=$(($altura3/100))
    resto=$(($altura3%100))
    echo USUARIO 3 es el mas alto con una altura de: $metro,$resto metros.

fi

#Si el usuario no introduce datos numéricos mostrará el siguiente mensaje:
else
echo "Error. Por favor introduzca datos numéricos."

fi