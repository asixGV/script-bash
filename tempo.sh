#!/bin/bash
clear
if [ `whoami` != 'root' ]
  then
    printf "\nHauries de ser usuari root per poguer executar aquest script.
Contacta amb algun administrador.\nGràcies.\n\n"
    exit
fi
echo Siusplau, escriu el nom del usuari:

read nomUsuari

echo Siusplau, donam el teu nom real:

read nomReal

echo Siusplau, escriu la clau secreta:

read -s clauSecreta
printf "\n"
useradd -c "${nomReal}" -m ${nomUsuari}
ret=$?
if [ $ret -ne 0 ]; then
        printf "Sortint de tempo.sh\n" 
	exit 1
else
        echo "Tot OK de moment... 25%"
fi

echo ${clauSecreta} | passwd --stdin ${nomReal}
passwd -e ${nomUsuari}


ret2=$?
if [ $ret2 -ne 0 ]; then
	printf "Sortint de tempo.sh\n"
 
        exit 1
else
	
        printf "L'usuari s'ha establert correctament al sistema, tot seguit el veuras al fitxer\n/etc/passwd\n\n"




fi


printf "\nNOU USUARI DE SISTEMA\n"

cat /etc/passwd | grep ${nomUsuari}
printf "\nHOST DE L'USUARI\n"
hostname


