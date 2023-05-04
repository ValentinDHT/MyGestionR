#!/bin/bash

echo "Veuillez saisir une @IP :"
read adrip


res=$(ping $adrip -w 3 | grep " 0% packet loss" | wc -l)

if [[ $res -eq 1 ]]
then 
	echo "l'adresse IP est joignable"
	echo $adrip >> pingQuiMarche.txt
else
	echo "l'adresse IP n'est pas joignable"
	echo $adrip >> pingQuiNeMarchePas
fi
echo ""
echo "[Appuyer sur entrer pour continuer]"
read