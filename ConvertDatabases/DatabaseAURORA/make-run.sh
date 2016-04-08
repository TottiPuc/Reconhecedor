#!/bin/bash

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####         speech recognition       #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################

clear

###############   main variables   ######################
Database="AURORA"
Path_files=/home/christianlab/reconhecedor_CETUC/OriginalDataBase"$Database"/
Out=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/
decision=Y

echo "do you want overwrite the existing databasew Y/n?"

read opcion
if [ "$opcion" == "$decision" ]; then

echo "."
echo "copying the original database files"
echo "."
#cp -r $Path_files $Out
#rm -r $Out/ConvertDataBaseAURORA/
#mv $Out/OriginalDataBaseAURORA/ $Out/ConvertDataBaseAURORA/
sleep 10
echo "."
echo "start converting audios WV1 to wav"
echo "."

./script_ConvertDatabase.sh $Out/ConvertDataBaseAURORA/

echo "."
echo "end of the process"
echo "."
fi

echo "."
echo "creating database training"
echo "."
sleep 10
#./database_train.sh

echo "."
echo "creating database test"
echo "."

#./database_test.sh




