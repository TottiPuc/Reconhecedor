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
USE_PHONE_FILES_FOR_TRANSCRIPTION=1

echo " *** Making a monophones0 nad monophones1 files (without and with short pauses)****"

DB=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseTIMIT
OUT=/home/christianlab/reconhecedor_CETUC/products/htk/phones
OUTList=/home/christianlab/reconhecedor_CETUC/products/htk

#****************************************************************************************#
#************ make monophones0 and monophones1 files from monphones file  ***************#

cp $DB/monophones.txt $OUT/monophones0.tmp
cp $DB/monophones.txt $OUT/monophones1.tmp

cat $OUT/monophones0.tmp | tr -d "\r" > $OUT/monophones0
cat $OUT/monophones1.tmp | tr -d "\r" > $OUT/monophones1

rm -rf $OUT/monophones0.tmp $OUT/monophones1.tmp

echo "sil" >> $OUT/monophones0
echo "sil" >> $OUT/monophones1
echo "sp" >> $OUT/monophones1

#****************************************************************************************#
#************  prepare special dictionary and wordnet for monophone test  ***************#

touch $OUT/dictionaryForPhonesTest
touch $OUT/grammarPhones

./createPhones.py $OUT/monophones0 $OUT/dictionaryForPhonesTest $OUT/grammarPhones

HParse  $OUT/grammarPhones $OUT/wordNetPhones

echo ""
echo " *** Listing words of train/test sentences in MLF file ***"
echo ""

touch $OUTList/wordsInTrainSentences
touch $OUTList/wordsInTestSentences
touch $OUTList/TrainSentences

echo "#!MLF!#" >> $OUTList/wordsInTrainSentences
find $DB/DatabaseComplet8KHz/Train/ -name "*stc.txt" | while read line
do
nam=`ls $line | cut -d '/' -f 9`
echo "\"*/$nam\"" >> $OUTList/wordsInTrainSentences
cat $line | tr -s " " "\012" >> $OUTList/wordsInTrainSentences
echo "." >> $OUTList/wordsInTrainSentences
sen=`cat $line`
echo "\"*/$nam\" $sen" >> $OUTList/TrainSentences
done 

# hacer lo mismo de arriba para los de test

echo ""
echo " *** listing phones of /train/test sentences in MFL file***"
echo ""

touch $OUT/dictionaryWithShortPause

cat $DB/dictionary.txt | sed 's/$/ sp/g' >> $OUT/dictionaryWithShortPause
echo "!ENTER sil" >> $OUT/dictionaryWithShortPause
echo "!EXIT sil" >> $OUT/dictionaryWithShortPause

echo ""
echo " *** create a master label file manually, comparing phone and word file***"
echo ""

touch $OUT/phonesInTrainSentences0
touch $OUT/phonesInTrainSentences1

echo "#!MLF!#" >> $OUT/phonesInTrainSentences0
echo "#!MLF!#" >> $OUT/phonesInTrainSentences1

ls $DB/DatabaseComplet8KHz/Train/*.phn.txt > list1
ls $DB/DatabaseComplet8KHz/Train/*.wrd.txt > list2

cat list1 | while read line2
do
nom=`ls $line2 | cut -d '/' -f 9`
echo "\"*/$nom\"" >> $OUTList/phonesInTrainSentences0
echo "\"*/$nam\"" >> $OUTList/phonesInTrainSentences1

done











