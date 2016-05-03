#!/bin/bash
#put in resultfolder the name you want, for your destination folder results ex. recognizer
resultfolder=reconecedor1
IN=~/$resultfolder/productsDatabase/DatabaseAURORA/DatabaseCorrupted8kHz/Test/babble/
ResulpathIn=~/$resultfolder/products/htk/mfccAURORA/testResultsWords.txt
ResulpathOut=~/$resultfolder/resultsAURORA

ls $IN | while read line 
do
echo "cleaning features and configuration files for test"

path=`pwd`

rm -r $path/loadMFCCTestAURORACorrupted $path/htkTestAURORAcorrupted

echo "testing aurora database"

make FOLDEROUT=$resultfolder DATA=$IN$line/ loadMFCCTestAURORACorrupted

echo "paso"
sleep 10

make FOLDEROUT=$resultfolder DATA=$IN$line/ htkTestAURORAcorrupted

name=`echo $IN$line | cut -d '/' -f 9-10 | sed 's/\//_/g'`

cp $ResulpathIn  $ResulpathOut/"baseline_"$name".txt"

done
