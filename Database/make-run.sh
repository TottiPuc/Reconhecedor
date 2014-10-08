#! /bin/bash 

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
Database="TIMIT"
Path_files=~/reconhecedor_CETUC/OriginalDataBases"$Database"
PathProducts=~/reconhecedor_CETUC/productsDatabase/Database"$Database"/DatabaseComplet8KHz
decision="sim"
##########################################################

#############   Configuration files and folders    ##############

echo ""
echo "#####################  WARNING# ###########################"
echo "."
echo    "  vai sobrescrever as pastas de treinamento e teste 
                tem certeza disso?"
echo "se vc tem certeza digite sim caso contrario pressione Enter"
echo "."
echo "###########################################################"
echo ""
echo "digite sim ou pressione Enter: "

read digite

if [ "$digite" == "$decision" ]; then


./Script_files.sh $Database $Path_files $PathProducts 

sleep 10s

echo "  ****** Converting Train Folder ***** "
echo ""     
./ConverterDatabases.sh $Path_files/Train $PathProducts/Train
echo ""
echo ""
#sleep 2s
echo "  ****** Converting Test Folder  ***** "
echo ""
./ConverterDatabases.sh $Path_files/Test $PathProducts/Test

else
echo""

echo "... Saida com sucesso nada a ser feito ..."
echo""
fi 


