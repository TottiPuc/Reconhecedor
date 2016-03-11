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

echo "."
echo "copying the original database files"
echo "."

cp -r $Path_files $Out

echo "."
echo "start converting audios WV1 to wav"
echo "."

./script_ConvertDatabase.sh $Out

echo "."
echo "end of the process"
echo "."

echo "."
echo "creating database training"
echo "."

./database_train.sh






