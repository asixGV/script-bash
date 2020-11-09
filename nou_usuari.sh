#!/bin/bash
# https://github.com/asixGV/script-bash
if [ `whoami` != 'root' ]
  then
    printf "\nHauries de ser usuari root per poguer executar aquest script.
Contacta amb algun administrador.\nGràcies.\n\n";
    exit 1;
fi


while [ `whoami` = 'root' ]
do
length=10
clear
	
	#Aconseguim que si o si l'usuari posi dos parametres
	if [ $# -gt 1 ] && [ $# -le 2 ]
	then
	if cat /etc/passwd | grep $1;
	then
	echo "L'usuari ja existeix, sortint..."
	exit 1
	else
	useradd -m "$1" -c "$2" 
	PASSWORD=$(date | sha256sum | head -c 10)
	
	echo $1:${PASSWORD} | chpasswd
	chage -d 0 $1
	echo "S'està guardant el nou usari i la nova contrasenya en un fitxer extern."
	echo $1 ${PASSWORD} >> auto_made_$1.txt
	fi
	
	cat /etc/passwd | grep $1
	if [ $? -eq 0 ]
		then
		echo "Tot correcte, l'usuari amb nom \e[4m$1\e[24m i comentari \e[4m$2\e[24m ha sigut creat correctament."
		fi
	
	fi

	exit 

done

