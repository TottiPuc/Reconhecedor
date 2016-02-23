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




