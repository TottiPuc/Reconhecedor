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

USE_CROSSWORD_TRIPHONE=0

echo " *** Making a monophones0 nad monophones1 files (without and with short pauses)****"

DB=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA
OUT=/home/christianlab/reconhecedor_CETUC/products/htk/phonesAURORA
OUTList=/home/christianlab/reconhecedor_CETUC/products/htk

#****************************************************************************************#
#************ make monophones0 and monophones1 files from monphones file  ***************#

#cp $DB/monophones.txt $OUT/monophones0.tmp
#cp $DB/monophones.txt $OUT/monophones1.tmp

#cat $OUT/monophones0.tmp | tr -d "\r" > $OUT/monophones0
#cat $OUT/monophones1.tmp | tr -d "\r" > $OUT/monophones1

#rm -rf $OUT/monophones0.tmp $OUT/monophones1.tmp

#echo "sil" >> $OUT/monophones0
#echo "sil" >> $OUT/monophones1
#echo "sp" >> $OUT/monophones1

#****************************************************************************************#
#************  prepare special dictionary and wordnet for monophone test  ***************#

#touch $OUT/dictionaryForPhonesTest
#touch $OUT/grammarPhones

#./createPhones.py $OUT/monophones0 $OUT/dictionaryForPhonesTest $OUT/grammarPhones

#HParse $OUT/grammarPhones $OUT/wordNetPhones

#echo ""
#echo " *** Listing words of train/test sentences in MLF file ***"
#echo ""

#touch $OUTList/wordsInTrainSentencesAURORA
#touch $OUTList/wordsInTestSentencesAURORA
#touch $OUTList/TrainSentencesAURORA


#echo "#!MLF!#" >> $OUTList/wordsInTrainSentencesAURORA
#find $DB/DatabaseComplete8kHz/Train/ -name "*.txt" | while read line
#do
#nam=`ls $line | cut -d '/' -f 9`
#cat $line |
#sed "s/..................................$//g"|
#sed 's/\.//g' |
#sed 's/\?//g' |
#sed 's/{//g' |
#sed 's/}//g' |
#sed 's/!//g' |
#sed 's/%//g' |
#sed 's/&//g' |
#sed 's/\///g' |
#sed 's/\://g' |
#sed 's/\;//g' |
#sed 's/\,//g' |
#sed 's/\"//g' |
#sed 's/\--//g' |
#sed "s/'em/\\\'em/g" |
#sed "s/(*)*//g" |
#tr [[:upper:]] [[:lower:]] >> $DB/DatabaseComplete8kHz/Train/$nam".tmp"

#echo "\"*/$nam\"" >> $OUTList/wordsInTrainSentencesAURORA
#cat $DB/DatabaseComplete8kHz/Train/$nam".tmp" | tr -s " " "\012" | sed "s/^'/\\\'/g" | sed 's/^"/\\\"/g' >> $OUTList/wordsInTrainSentencesAURORA
#echo "." >> $OUTList/wordsInTrainSentencesAURORA
#sen=`cat $DB/DatabaseComplete8kHz/Train/$nam".tmp"`
#echo "\"*/$nam\" $sen" >> $OUTList/TrainSentencesAURORA
#done
####
# hacer lo mismo de arriba para los de test

#echo ""
#echo " *** listing phones of /train/test sentences in MFL file***"
#echo ""

#touch $OUT/dictionaryWithShortPause.tmp

#cat $DB/dictionary.txt | tr [[:upper:]] [[:lower:]] |sed 's/$/ sp/g' >> $OUT/dictionaryWithShortPause.tmp
#echo "!ENTER sil" >> $OUT/dictionaryWithShortPause.tmp
#echo "!EXIT sil" >> $OUT/dictionaryWithShortPause.tmp

#cat $OUT/dictionaryWithShortPause.tmp | sed 's/\t/  /g' > $OUT/dictionaryWithShortPause 

#echo ""
#echo " *** create a master label file manually, comparing phone and word file***"
#echo ""

#touch $OUT/phonesInSentencesConfiguration0
#touch $OUT/phonesInSentencesConfiguration1

#echo "EX" >> $OUT/phonesInSentencesConfiguration0
#echo "IS sil sil" >> $OUT/phonesInSentencesConfiguration0
#echo "DE sp" >> $OUT/phonesInSentencesConfiguration0

#echo "EX" >> $OUT/phonesInSentencesConfiguration1
#echo "IS sil sil" >> $OUT/phonesInSentencesConfiguration1

#HLEd -T 0 -X phn.txt -l '*' -d $OUT/dictionaryWithShortPause -i $OUT/phonesInTrainSentences0.txt $OUT/phonesInSentencesConfiguration0 $OUTList/wordsInTrainSentencesAURORA

#echo "" >> $OUT/phonesInTrainSentences0.txt

#HLEd -T 0 -X phn.txt -l '*' -d $OUT/dictionaryWithShortPause -i $OUT/phonesInTrainSentences1.txt $OUT/phonesInSentencesConfiguration1 $OUTList/wordsInTrainSentencesAURORA

#echo "" >> $OUT/phonesInTrainSentences1.txt

#falta los fones de los archivos de test
# igual falta los fones de los archivos de test

# generating all posible triphonescombinations (and not only the ones in sentences)

#echo "*** Generating all popsible triphones ***"

#cp $OUT/monophones1 $OUT/triphonesAllCombinations.txt

#./generateTriphones.py $OUT/monophones1 $OUT/triphonesAllCombinations.txt

touch $OUT/silenceConfiguration.txt

echo "AT 2 4 0.2 {sil.transP}" >> $OUT/silenceConfiguration.txt
echo "AT 4 2 0.2 {sil.transP}" >> $OUT/silenceConfiguration.txt
echo "AT 1 3 0.3 {sp.transP}" >> $OUT/silenceConfiguration.txt
echo "TI silst {sil.state[3],sp.state[2]}" >> $OUT/silenceConfiguration.txt

touch $OUT/modelCloneForTriphoneConfiguration.txt

echo "CL $OUT/triphones1.txt" >> $OUT/modelCloneForTriphoneConfiguration.txt

./confSilence.py $OUT/monophones1 $OUT/modelCloneForTriphoneConfiguration.txt

touch $OUT/mergeSpSilConfiguration.txt

echo "ME sil sp sil" >> $OUT/mergeSpSilConfiguration.txt
echo "ME sil sil sil" >> $OUT/mergeSpSilConfiguration.txt
echo "ME sp sil sil" >> $OUT/mergeSpSilConfiguration.txt


touch  $OUT/triphoneConfiguration.txt

echo "WB sil" >> $OUT/triphoneConfiguration.txt
echo "WB sp" >> $OUT/triphoneConfiguration.txt

if [ $USE_CROSSWORD_TRIPHONE -eq 1 ]
then
echo "NB sp" >> $OUT/triphoneConfiguration.txt
fi

echo "TC" >> $OUT/triphoneConfiguration.txt

#rm -rf $OUT/*.tmp

# in case to restart the process the archives .txt.tmp into the folder reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseComplete8kHz/Train must be deleted "rm -rf *.tmp"
