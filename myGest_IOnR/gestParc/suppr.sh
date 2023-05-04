#!/bin/bash

echo " "
continue=1
while [[ $continue -ne 0 ]]
do
 echo -n "Donner l'id de l'équipement à supprimer : " 
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

supp="Use MyGest; DELETE FROM Equipement WHERE id = $id"

quitter=1
while [[ $quitter -ne 0 ]]
do
 echo "Confirmer la suppression (o/n) : "
 read -r confirm

 case "$confirm" in
  oui | o | O | Oui | OUI )
  mdp=btsinfo
  mysql --user=mygest --password=$mdp -e "$supp"
  echo "Les données ont été supprimées"
  echo ""
  echo "[Appuyer sur entrer pour continuer]"
  read
  quitter=0
  ;;

  non | n | N | Non | NON )
  echo "abandon de la requête"
  quitter=0
  ;;

  * )
  echo "erreur dans la saisie"
  ;;
 esac
done