#!/bin/bash
################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####         speech recognition       #########
#######       CETUC - PUC - RIO       ##########
#####     christian@cetuc.puc-rio.br    ########
#####       dayan3846@gmail.com.co      ########
#==============================================#
################################################

IN=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseComplete8kHz/Test
OUT=/home/christianlab/reconhecedor_CETUC/products/htk/mfccAURORA

#*********************************************************************************#
#***  navigate through AURORA folders and files to list them in config files   ***#

echo "*** listing AURORA testing data ***"

find $IN -name "*.wav" | while read line
do
nam=`ls $line | cut -d '/' -f 9 | sed 's/.wav/.feat/g'`
echo $line $OUT'/featuresTest/'$nam >> $OUT/testWavAndFeaturesFiles.txt
echo $OUT'/featuresTest/'$nam >> $OUT/testFeaturesFiles.txt
done

#***************** Extract MFCC from AURORA  ************************#

echo "*** Extracting MFCC from AURORA testing data ***"

HCopy -A -D -T 1 -C $OUT/HCopyParametersForTrain.txt -S $OUT/testWavAndFeaturesFiles.txt


#************************ HDecode Parameters *************************#

cat $OUT/featureInfo.txt | while read line
do
echo $line >> $OUT/HDecodeParameters.txt
done

echo "STARTWORD  = !ENTER" >> $OUT/HDecodeParameters.txt
echo "ENDWORD  = !EXIT" >> $OUT/HDecodeParameters.txt



