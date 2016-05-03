#!/bin/bash
#put in resultfolder the name you want, for your destination folder results ex. recognizer
resultfolder=reconecedor1

path=`pwd`

rm -r $path/createLMAURORA $path/createPhoneAURORA $path/loadMFCCTrainAURORA $path/htkTrainAURORA 

echo "creating language model"

make FOLDEROUT=$resultfolder createLMAURORA 

echo "making phones"

make FOLDEROUT=$resultfolder createPhoneAURORA

echo "getting MFCC attributes"

make FOLDEROUT=$resultfolder loadMFCCTrainAURORA

echo "Training speech recognizer"

make FOLDEROUT=$resultfolder htkTrainAURORA
