#!/bin/bash


echo "creating language model"

make createLMAURORA 

echo "making phones"

make createPhoneAURORA

echo "getting MFCC attributes"

make loadMFCCTrainAURORA

echo "Training speech recognizer"

make htkTrainAURORA
