#!//bin/bash

quitter=1
while [[ $quitter -ne 0 ]]
do
echo " "
echo "Que souhaitez-vous consulter" 
echo "1) Toutes les information"
echo "2) Seulement les machines"
echo "3) Seulement les serveurs"
echo "4) Seulement les switchs"
echo "0) Quitter"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		infoall="Use MyGest; Select * From Equipement"
		mysql --user=mygest --password=btsinfo -e "$infoall"
		echo ""
		echo "[Appuyer sur entrer pour continuer]"
		read
		;;
	2 )
		infoma="Use MyGest; Select * From Equipement WHERE idT=1"
		mysql --user=mygest --password=btsinfo -e "$infoma"
		echo ""
		echo "[Appuyer sur entrer pour continuer]"
		read
		;;
	
    3 ) 
       infosrv="Use MyGest; Select * From Equipement WHERE idT=3"
		mysql --user=mygest --password=btsinfo -e "$infosrv"
        echo ""
		echo "[Appuyer sur entrer pour continuer]"
		read
		;;

    4 )
       infosw="Use MyGest; Select * From Equipement WHERE idT=2"
	    mysql --user=mygest --password=btsinfo -e "$infosw"
        echo ""
		echo "[Appuyer sur entrer pour continuer]"
		read
	    ;;
    
    
    0 )
		quitter=0
	
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done





