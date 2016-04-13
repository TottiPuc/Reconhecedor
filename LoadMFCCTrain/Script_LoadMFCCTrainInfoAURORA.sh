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

SAMPLE_RATE=8000

IN=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseComplete8kHz/Train
OUT=/home/christianlab/reconhecedor_CETUC/products/htk/mfccAURORA


#*********************************************************************************#
#***  navigate through AURORA folders and files to list them in config files   ***#
#********        so they can be passed to the recognizer later         *********#

find $IN -name "*.wav" | while read line
do
nam=`ls $line | cut -d '/' -f 9 | sed 's/.wav/.feat/g'`
echo $line $OUT'/featuresTrain/'$nam >> $OUT/trainWavAndFeaturesFiles.txt
echo $OUT'/featuresTrain/'$nam >> $OUT/trainFeaturesFiles.txt
done

#***************** write MFCC parameters in a file *****************************#

touch $OUT/featureInfo.txt

echo "TARGETKIND = MFCC_0_D_A_Z" >> $OUT/featureInfo.txt
echo "ZMEANSOURCE = T" >> $OUT/featureInfo.txt
echo "SAVECOMPRESSED = T" >> $OUT/featureInfo.txt
echo "SAVEWITHCRC = T" >> $OUT/featureInfo.txt
echo "ENORMALIZE = T" >> $OUT/featureInfo.txt
echo "NUMCHANS = 26" >> $OUT/featureInfo.txt
echo "TARGETRATE = 100000.0" >> $OUT/featureInfo.txt
echo "WINDOWSIZE = 250000.0" >> $OUT/featureInfo.txt
echo "USEHAMMING = T" >> $OUT/featureInfo.txt
echo "PREEMCOEF = 0.97" >> $OUT/featureInfo.txt
echo "CEPLIFTER = 22" >> $OUT/featureInfo.txt
echo "NUMCEPS = 12" >> $OUT/featureInfo.txt


#****************** extract MFCC from AURORA training data  ********************#

echo "***  Extracting MFCC from AURORA training data  ***"

samplePeriodInMicroseconds=`expr 10000000 / $SAMPLE_RATE`

touch $OUT/HCopyParametersForTrain.txt

echo "SOURCEKIND = WAVEFORM" >> $OUT/HCopyParametersForTrain.txt
echo "SOURCEFORMAT = WAV" >> $OUT/HCopyParametersForTrain.txt
echo "SOURCERATE = "$samplePeriodInMicroseconds >> $OUT/HCopyParametersForTrain.txt

cat $OUT/featureInfo.txt | while read line
do
echo $line >> $OUT/HCopyParametersForTrain.txt
done

HCopy -A -D -T 1 -C $OUT/HCopyParametersForTrain.txt -S $OUT/trainWavAndFeaturesFiles.txt


#*****************************************************************************************#
#* make HMM prototype file (number of states, transition probability between them, etc) *#

touch $OUT/proto.txt

echo -e "~o <VecSize> 39 <MFCC_0_D_A_Z>" >> $OUT/proto.txt
echo -e "~h "proto"" >> $OUT/proto.txt
echo -e "<BeginHMM>" >> $OUT/proto.txt
echo -e "\t<NumStates> 5" >> $OUT/proto.txt
echo -e "\t<State> 2" >> $OUT/proto.txt
echo -e "\t\t<Mean> 39" >> $OUT/proto.txt
echo -e "\t\t\t0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0" >> $OUT/proto.txt
echo -e "\t\t<Variance> 39" >> $OUT/proto.txt
echo -e "\t\t\t1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" >> $OUT/proto.txt
echo -e "\t<State> 3" >> $OUT/proto.txt
echo -e "\t\t<Mean> 39" >> $OUT/proto.txt
echo -e "\t\t\t0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0" >> $OUT/proto.txt
echo -e "\t\t<Variance> 39" >> $OUT/proto.txt
echo -e "\t\t\t1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" >> $OUT/proto.txt
echo -e "\t<State> 4" >> $OUT/proto.txt
echo -e "\t\t<Mean> 39" >> $OUT/proto.txt
echo -e "\t\t\t0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0" >> $OUT/proto.txt
echo -e "\t\t<Variance> 39" >> $OUT/proto.txt
echo -e "\t\t\t1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1" >> $OUT/proto.txt
echo -e "\t<TransP> 5" >> $OUT/proto.txt
echo -e "\t\t0 1 0 0 0" >> $OUT/proto.txt
echo -e "\t\t0 0.6 0.4 0 0" >> $OUT/proto.txt
echo -e "\t\t0 0 0.6 0.4 0" >> $OUT/proto.txt
echo -e "\t\t0 0 0 0.7 0.3" >> $OUT/proto.txt
echo -e "\t\t0 0 0 0 0" >> $OUT/proto.txt
echo "<EndHMM>" >> $OUT/proto.txt

