#! /bin/bash

echo " "
echo "Veuillez saisir une adresse IP :"
read -r ip
echo "Veuillez saisir un port :"
read -r port

timeout 5 telnet $ip $port

if [[ $? -eq 0 ]]; then
    echo "Le port TCP est ouvert"
else 
    echo "Le port TCP est fermé"
fi
echo ""
echo "[Appuyer sur entrer pour continuer]"
read