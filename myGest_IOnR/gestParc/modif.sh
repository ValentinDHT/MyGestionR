#!/bin/bash

echo " "
continue=1
while [[ $continue -ne 0 ]]
do
 echo -n "Donner l'id de l'équipement à modifier : " 
 read -r id
 findid="use MyGest; SELECT * FROM Equipement WHERE id = $id"
 result=$(mysql --user=mygest --password=btsinfo -e "$findid")


 if [ -z "$result" ]; then
    echo "Aucun équipement trouvé avec l'id $id"
    
 else
    echo "Equipement avec l'id $id :"
    echo "$result" 
    continue=0
 fi
done

echo -n "Entrez le nom de l'équipement : "
read nom
echo -n "Entrez l'adresse MAC de l'équipement : " 
read adMAC
echo -n "Entrez l'adresse IP de l'équipement : " 
read adIP
echo -n "Entrez la valeur CIDR de l'équipement : " 
read cidr
echo -n "Entrez l'ID du type d'équipement : " 
read idT

modif="use MyGest; UPDATE Equipement SET nom='$nom', adMAC='$adMAC', adIP='$adIP', CIDR=$cidr, idT=$idT WHERE id=$id"

quitter=1
while [[ $quitter -ne 0 ]]
do
 echo "Confirmer l'insertion (o/n) : "
 read -r confirm

 case "$confirm" in
 oui | o | O | Oui | OUI )
 mdp=btsinfo
 mysql --user=mygest --password=$mdp -e "$modif"
 echo "Les données ont été mises à jour"
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