#!/bin/bash

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
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
echo "copiando arquivos do banco original"
echo "."

cp -r $Path_files $Out

echo "."
echo "inicio converção de audios wv1 para wav"
echo "."

./script_ConvertDatabase.sh $Out

echo "."
echo "fim do processo"
echo "."





