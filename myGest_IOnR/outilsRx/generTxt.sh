#!/bin/bash

   infoip="Use MyGest; Select adIP From Equipement"
	mysql --user=mygest --password=btsinfo -e "$infoip"  > ip_adresse.txt
  
  echo "Un fichier ip_adresse.txt a été créé."
  echo ""
  echo "[Appuyer sur entrer pour continuer]"
  read
    