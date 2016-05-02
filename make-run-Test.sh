#!/bin/bash

IN=~/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseCorrupted8kHz/Test/babble/
ResulpathIn=~/reconhecedor_CETUC/products/htk/mfccAURORA/testResultsWords.txt
ResulpathOut=~/reconhecedor_CETUC/resultsAURORA

ls $IN | while read line 
do
echo "cleaning features and configuration files for test"

path=`pwd`

rm -r $path/loadMFCCTestAURORACorrupted $path/htkTestAURORAcorrupted

echo "testing aurora database"

make DATA=$IN$line/ loadMFCCTestAURORACorrupted

echo "paso"
sleep 10

make DATA=$IN$line/ htkTestAURORAcorrupted

name=`echo $IN$line | cut -d '/' -f 9-10 | sed 's/\//_/g'`

cp $ResulpathIn  $ResulpathOut/"baseline_"$name".txt"

done
