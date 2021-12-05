#!/bin/bash

#Creo una variable que usaré mas tarde.
result=0

#Pido ambos números por teclado.
read -p "Introduzca el primer número: " numero1
read -p "Introduzca el segundo número: " numero2

#Compruebo si lo que estoy recogiendo por teclado realmente son dos números.
if [ $numero1 -ge 0 ] && [ $numero2 -ge 0 ]
then

#Con esta condición establezco que hasta que el número 1 no sea superior al número 2 no salga del bucle.
until [ $numero1 -gt $numero2 ]
    do
        
        #Guardo en esta variable cada valor del número 1 y lo voy sumando.
        result=$(($result+$numero1))

        #Voy incrementando de uno en uno el valor del número 1 para que vaya sumando dentro de la variable anterior.
        numero1=$(($numero1+1))
        
        

    done

echo El resultado de la suma del rango es: $result

#Si lo que he recogido por teclado no son dos números, devolverá este mensaje.
else
    echo "Por favor, introduzca un valor numérico"
fi