#!/bin/bash

#Pide al usuario que introduzca su edad y la almacena en una variable
read -p "Introduzca su edad: " edad

#Comprueba si el usuario de verdad ha introducido un dato numérico. Si no lo ha hecho redirigirá el error a null para que no aparezca en pantalla.
if [ $edad -ge 0 2>/dev/null ]
then

#Almacena el comando para sacar el año en una variable.
anno=$(date +%Y)
#Calcula el año de nacimiento del usuario restando el año actual - su edad.
anno2=$(($anno - $edad))
#Extrae el número de la década (El tercer dígito del año) a la que pertenece el usuario.
annofin=$(echo $anno2 | cut -c3)


#Ahora comprobará su número de década y devolverá un resultado.
case $annofin in

0) echo "Si naciste en el año $anno2, naciste en el 2000";;
1) echo "Si naciste en el año $anno2, naciste en la década de 2010";;
2) echo "Si naciste en el año $anno2, naciste en la década de 2020";;
3) echo "Si naciste en el año $anno2, naciste en la década de 1930";;
4) echo "Si naciste en el año $anno2, naciste en la década de 1940";;
5) echo "Si naciste en el año $anno2, naciste en la década de 1950";;
6) echo "Si naciste en el año $anno2, naciste en la década de 1960";;
7) echo "Si naciste en el año $anno2, naciste en la década de 1970";;
8) echo "Si naciste en el año $anno2, naciste en la década de 1980";;
9) echo "Si naciste en el año $anno2, naciste en la década de 1990";;

esac

#Si el valor introducido no es un número devolverá el siguiente mensaje.
else

echo "Datos incorrectos. Por favor introduzca solo datos numéricos."

fi