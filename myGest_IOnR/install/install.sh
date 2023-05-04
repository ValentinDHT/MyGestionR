#!/bin/bash


echo "installation des elements essentiels du programme"

continuer=1
while [[ $continuer -ne 0 ]]
do
 echo " Etes-vous sur un poste serveur? (o/n) : "
 read -r confirm

 case "$confirm" in
  oui | o | O | Oui | OUI )
  srv=1

  continuer=0
  ;;

  non | n | N | Non | NON )
  srv=0

  continuer=0
  ;;

  * )
  echo "erreur dans la saisie"
  ;;
 esac
done
echo "serveur=$srv" > config.sh


echo "installation des paquets"

sudo apt install -y figlet lolcat | sudo apt update -y

mdpBDD=btsinfo
logind=MyGest
login=mygest
mdp=btsinfo

mysql --user=eleve --password=$mdpBDD -e "CREATE DATABASE "$logind";
CREATE USER \""$login"\"@\"localhost\" IDENTIFIED BY \""$mdp"\"; GRANT
ALL ON "$logind".* TO \""$login"\"@\"localhost\";"


