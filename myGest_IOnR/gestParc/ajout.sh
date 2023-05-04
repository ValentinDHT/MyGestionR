#!/bin/bash

echo " "
echo "Veuillez saisir les informations suivantes:"
echo -n ">Nom:"
read -r nom
echo -n ">Addresse MAC:"
read -r mac
echo -n ">Addresse IP:"
read -r IP
echo -n ">Masque CIDR:"
read -r cidr
echo "Type (1: machine; 2: switch; 3: serveur) :"
read -r Type

base=Equipement
ajout="Use MyGest; INSERT INTO $base (nom, adMAC, adIP, CIDR, idT) VALUES ('$nom', '$mac', '$IP', $cidr, $Type);"
echo "Récapitulatif de la requete : > $ajout"

quitter=1
while [[ $quitter -ne 0 ]]
do
 echo "Confirmer l'insertion (o/n) : "
 read -r confirm

 case "$confirm" in
 oui | o | O | Oui | OUI )
 mdp=btsinfo
 mysql --user=mygest --password=$mdp -e "$ajout"
 echo "Les saisies ont été ajoutées à la base de données"
 echo ""
 echo "[Appuyer sur entrer pour continuer]"
 read
 quitter=0
 ;;

 non | n | N | Non | NON )
 echo "abandon de la requête"
 quitter=0
 ;;

 *)
 echo "erreur dans la saisie"
 ;;
 esac
done
