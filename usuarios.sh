#!/bin/bash

#Creo la variable bucle que controlará el bucle que impedirá que el usuario salga del programa hasta que él quiera hacerlo.
bucle=0

#Inicio el bucle que hará que el programa se repita hasta que el usuario lo desee.
until [ $bucle -eq 1 ]
do

#Inicio otra variable bucle que usaré al final del programa. Lo hago en este punto y no antes porque quiero que cada vez que se inicie el primer bucle esta variable valga 0.
bucle2=0

    #Le pido al usuario que introduzca su nombre y lo almaceno en una variable.
    read -p "Introduzca el nombre del usuario: " usuario
    echo " "

    #Meto el nombre que ha dado el usuario en otra variable que almacene el número de parámetros que este ha introducido.
    cuenta=$(echo $usuario | wc -w)

    #Ahora controlaré si el usuario realmente ha introducido un parámetro o no.
    if [ $cuenta -eq 1 ]
    then

        #Compruebo si el usuario está registrado en el sistema.
        if grep $usuario /etc/passwd >/dev/null
        then

        #Almaceno cada dato que se desea mostrar en una variable y a continuación se lo muestro todo al usuario.
        nombre=$(cat /etc/passwd | grep "$usuario" | cut -d":" -f1)
        uid=$(cat /etc/passwd | grep "$usuario" | cut -d":" -f3)
        gid=$(cat /etc/passwd | grep "$usuario" | cut -d":" -f4)
        directorio=$(cat /etc/passwd | grep "$usuario" | cut -d":" -f6)

        echo "Nombre: " $nombre
        echo "UID: " $uid
        echo "GID: " $gid
        echo "Directorio de trabajo: " $directorio
        echo " "

        #Si no se encuentra al usuario en el sistema devolverá un mensaje.
        else

        echo "Usuario no localizado en el sistema."
        echo " "

        fi

    #Si el usuario no introduce un nombre de usuario o introduce mas de uno se le avisará con un mensaje.
    else

    echo "Por favor, asegurese de escribir un nombre de usuario. Solo uno a la misma vez."

    fi

    #Tras ejecutarse el programa principal hago otro bucle dentro del cual consultaré al usuario si quiere volver a introducir otro nombre.
    until [ $bucle2 -eq 1 ]
    do

        read -p "¿Desea buscar otro usuario? (Si/No): " opcion
        echo " "
        opcion2=$(echo $opcion | tr [:upper:] [:lower:]) #Para permitir que el usuario pueda poner mayúsculas convierto su respuesta en minúsulas de manera automática.

        #Si el usuario dice que NO, romperá tanto el primer bucle como el segundo y saldrá del programa.
        if [ "$opcion2" = no ]
        then

        bucle=1
        bucle2=1

        #Si el usuario dice que SÍ, romperá solo el segundo bucle y volverá al principio del primero, volviendo a ejecutar de nuevo el programa y devolviéndole a este menú tras hacerlo.
        elif [ "$opcion2" = si ]
        then

       

        bucle2=1

        #Si el usuario no pone nada o introduce una respuesta errónea no romperá ningún bucle y le devolverá al principio del segundo tras mostrarle un mensaje de advertencia.
        else

        echo "Opción no valida, por favor seleccione Si o No"
        echo " "

        fi

    done
    
done