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
USE_PHONE_FILES_FOR_TRANSCRIPTION=0

echo " *** Making a monophones0 nad monophones1 files (without and with short pauses)****"

DB=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseTIMIT
OUT=/home/christianlab/reconhecedor_CETUC/products/htk/phonesTIMIT
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

touch $OUTList/wordsInTrainSentencesTIMIT
touch $OUTList/wordsInTestSentencesTIMIT
touch $OUTList/TrainSentencesTIMIT

echo "#!MLF!#" >> $OUTList/wordsInTrainSentencesTIMIT
find $DB/DatabaseComplet8KHz/Train/ -name "*stc.txt" | while read line
do
nam=`ls $line | cut -d '/' -f 9`
echo "\"*/$nam\"" >> $OUTList/wordsInTrainSentencesTIMIT
cat $line | tr -s " " "\012" >> $OUTList/wordsInTrainSentencesTIMIT
echo "." >> $OUTList/wordsInTrainSentencesTIMIT
sen=`cat $line`
echo "\"*/$nam\" $sen" >> $OUTList/TrainSentencesTIMIT
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

if [ $USE_PHONE_FILES_FOR_TRANSCRIPTION -eq 1 ]
then
touch $OUT/phonesInTrainSentences0.tmp
touch $OUT/phonesInTrainSentences1.tmp

echo "#!MLF!#" >> $OUT/phonesInTrainSentences0.tmp
echo "#!MLF!#" >> $OUT/phonesInTrainSentences1.tmp

ls $DB/DatabaseComplet8KHz/Train/*.phn.txt > $OUT/list1.tmp
ls $DB/DatabaseComplet8KHz/Train/*.wrd.txt > $OUT/list2.tmp

cat $OUT/list1.tmp | while read line2
do
nom=`ls $line2 | cut -d '/' -f 9`
echo "\"*/$nom\"" >> $OUT/phonesInTrainSentences0.tmp
cat $line2 >> $OUT/phonesInTrainSentences0.tmp
echo "." >> $OUT/phonesInTrainSentences0.tmp
#echo "\"*/$nam\"" >> $OUTList/phonesInTrainSentences1
done


./createMasterLabels.py  $OUT/list2.tmp  $OUT/list1.tmp $OUT/phonesInTrainSentences1.tmp

cat $OUT/phonesInTrainSentences1.tmp | sed 's/\/home\/christianlab\/reconhecedor_CETUC\/productsDatabase\/DatabaseTIMIT\/DatabaseComplet8KHz\/Train//g' > $OUT/phonesInTrainSentences1.txt

echo "" >> $OUT/phonesInTrainSentences1.txt
echo "" >> $OUT/phonesInTrainSentences0.tmp
mv $OUT/phonesInTrainSentences0.tmp $OUT/phonesInTrainSentences0.txt

else

touch $OUT/phonesInSentencesConfiguration0
touch $OUT/phonesInSentencesConfiguration1

echo "EX" >> $OUT/phonesInSentencesConfiguration0
echo "IS sil sil" >> $OUT/phonesInSentencesConfiguration0
echo "DE sp" >> $OUT/phonesInSentencesConfiguration0

echo "EX" >> $OUT/phonesInSentencesConfiguration1
echo "IS sil sil" >> $OUT/phonesInSentencesConfiguration1

HLEd -T 0 -X phn.txt -l '*' -d $OUT/dictionaryWithShortPause -i $OUT/phonesInTrainSentences0.tmp $OUT/phonesInSentencesConfiguration0 $OUTList/wordsInTrainSentencesTIMIT

echo "" >> $OUT/phonesInTrainSentences0.tmp

HLEd -T 0 -X phn.txt -l '*' -d $OUT/dictionaryWithShortPause -i $OUT/phonesInTrainSentences1.tmp $OUT/phonesInSentencesConfiguration1 $OUTList/wordsInTrainSentencesTIMIT

echo "" >> $OUT/phonesInTrainSentences1.tmp

#falta los fones de los archivos de test

cat $OUT/phonesInTrainSentences0.tmp | sed 's/stc.phn.txt/phn.txt/g' > $OUT/phonesInTrainSentences0.txt
cat $OUT/phonesInTrainSentences1.tmp | sed 's/stc.phn.txt/phn.txt/g' > $OUT/phonesInTrainSentences1.txt
# igual falta los fones de los archivos de test

fi

# generating all posible triphonescombinations (and not only the ones in sentences)

echo "*** Generating all popsible triphones ***"

cp $OUT/monophones1 $OUT/triphonesAllCombinations

./generateTriphones.py $OUT/monophones1 $OUT/triphonesAllCombinations

touch $OUT/silenceConfiguration.txt

echo "AT 2 4 0.2 {sil.transP}" >> $OUT/silenceConfiguration.txt
echo "AT 4 2 0.2 {sil.transP}" >> $OUT/silenceConfiguration.txt
echo "AT 1 3 0.3 {sp.transP}" >> $OUT/silenceConfiguration.txt
echo "TI silst {sil.state[3],sp.state[2]}" >> $OUT/silenceConfiguration.txt

touch $OUT/modelCloneForTriphoneConfiguration

echo "CL $OUT/triphones1.txt" >> $OUT/modelCloneForTriphoneConfiguration

./confSilence.py $OUT/monophones1 $OUT/modelCloneForTriphoneConfiguration

touch $OUT/mergeSpSilConfiguration

echo "ME sil sp sil" >> $OUT/mergeSpSilConfiguration
echo "ME sil sil sil" >> $OUT/mergeSpSilConfiguration
echo "ME sp sil sil" >> $OUT/mergeSpSilConfiguration

touch  $OUT/triphoneConfiguration

echo "WB sil" >> $OUT/triphoneConfiguration
echo "WB sp" >> $OUT/triphoneConfiguration

if [ $USE_CROSSWORD_TRIPHONE -eq 1 ]
then
echo "NB sp" >> $OUT/triphoneConfiguration
fi

echo "TC" >> $OUT/triphoneConfiguration

rm -rf $OUT/*.tmp










