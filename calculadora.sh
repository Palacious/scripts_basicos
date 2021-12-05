#!/bin/bash

#Nada mas iniciar el script creará el directorio errores donde irán a parar todos los errores.
mkdir errores 2>/dev/null

#Establece la función suma.
 suma(){
     #Pide al usuario que introduzca los dos números con los que se hará la cuenta.
    read -p "Introduzca el primer número: " a
    read -p "Introduzca el segundo número: " b

    #Comprueba si el usuario realmente ha introducido dos números. Si lo hace realizará la cuenta y mostrará el resultado. Los errores se descartarán en un txt independiente para cada error.
    if [ $a -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] && [ $b -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] 
    then
    resultado=$(($a+$b))
    echo " "
    echo "El resultado de la suma es: $resultado"

    #Si el usuario no introduce dos números le saltará un mensaje de error.
    else
    echo " "
    echo "ERROR. Por favor introduzca solo datos numéricos."

    fi
}

    #El resto de funciones siguen la misma lógica que la función suma.
resta(){
    read -p "Introduzca el primer número: " a
    read -p "Introduzca el segundo número: " b

    if [ $a -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] && [ $b -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] 
    then
    resultado=$(($a-$b))
    echo " "
    echo "El resultado de la resta es: $resultado"

    else
    echo " "
    echo "ERROR. Por favor introduzca solo datos numéricos."

    fi
}

 division(){
    read -p "Introduzca el primer número: " a
    read -p "Introduzca el segundo número: " b

    if [ $a -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] && [ $b -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] 
    then
    #De esta forma el resultado de la división nos podrá mostrar hasta dos decimales.
    resultado=$(echo "scale=2; $a/$b" | bc)

    echo " "
    echo "El resultado de la división es: $resultado"

    else
    echo " "
    echo "ERROR. Por favor introduzca solo datos numéricos."

    fi
}

multiplicacion(){
    read -p "Introduzca el primer número: " a
    read -p "Introduzca el segundo número: " b

    if [ $a -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] && [ $b -ge 0 2>>./errores/error_$(date +%d:%m:%Y:%R:%s).txt ] 
    then
    resultado=$(($a*$b))

    echo " "
    echo "El resultado de la multiplicación es: $resultado"

    else
    echo " "
    echo "ERROR. Por favor introduzca solo datos numéricos."

    fi
}

#Inicializo la variable "bucle", que será lo que hará que el usuario permanezca en el menú de la calculadora todo el rato.
bucle=0




#La variable bucle vale "0" y el menú de la calculadora está dentro del bucle until. Hasta que la variable "bucle" no valga "1" el usuario verá siempre el menú.
until [ $bucle -eq 1 ]
do

    #Inicializo la variable "i" para hacer un contador.
    i=0
    #Esto es una forma rápida de poner unos cuanto saltos seguidos con un contador, para que quede mas estilizado el script a la hora de ejecutarlo.
    while [ $i -lt 4 ]
    do
    echo " "
    i=$(($i+1))
    done

    #Pido al usuario que introduzca una de las posibles opiones y se las muestro mediante mensajes en pantalla. Luego almaceno lo que el usuario introduzca en una variable.
    echo "Introduzca el dígito del tipo de operación que desea hacer: "
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Dividir"
    echo "4. Multiplicar"
    echo "5. Salir"
    echo " "
    read calcu
    
   #Mediante un case comprobaré la opción introducida por el usuario. La opción invocará directamente la función correspondiente.
    case $calcu in
    1) suma;;
    2) resta;;
    3) division;;
    4) multiplicacion;;

    #Al pulsar la opción "5" esta devolverá un mensaje de despedida e igualará la variable "bucle" a 1; al hacerlo el usuario saldrá del bucle until y acabará el programa.
    5) 
    
    echo " "
    echo "ADIOS MUY BUENAS"
    bucle=1
    ;;

    #Si el usuario no introduce ninguno de los valores señalados en el menú o introduce otra cosa le mostrará un mensaje de error y volverá a ejecutarse el menú.
    *)

    echo " "
    echo "ERROR. Por favor, elija solo una de las opciones."
    
    ;;
    esac

done