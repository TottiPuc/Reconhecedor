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
PathDictionary=~/reconhecedor_CETUC/productsDatabase/Database"$Database"
decision="y"
##########################################################

#############   Configuration files and folders    ##############

echo ""
echo "#####################  WARNING# ###########################"
echo "."
echo    " would  you like to overwrite train and test folder?"
echo      "if you are sure press y otherwise  press any key"
echo "."
echo "###########################################################"
echo ""
echo "Press y ou Enter: "

read digite

if [ "$digite" == "$decision" ]; then


./Script_files.sh $Database $Path_files $PathProducts $PathDictionary

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

echo ""
echo ""
#sleep 2s
echo "  ****** Copy some test samples to another folder, so we can make fast tests  ***** "
echo "  ****** Creating a small-test folder  ***** "
echo ""
./Script_Small_test.sh

echo ""
echo "  ****** Fixing dictionary  ***** "
echo ""




else
echo""

echo "... procedure performed successfully ..."
echo""
fi 


