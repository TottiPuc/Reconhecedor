#!/bin/bash

echo "creating folder files..."

path=~/

mkdir -p $path"reconhecedor_CETUC"/productsDatabase $path"reconhecedor_CETUC"/products/htk/mfccAURORA $path"reconhecedor_CETUC"/products/htk/mfccAURORA/featuresTest $path"reconhecedor_CETUC"/products/htk/mfccAURORA/featuresTrain $path"reconhecedor_CETUC"/products/htk/mfccAURORA/model  $path"reconhecedor_CETUC"/products/htk/mfccAURORA/model/hmm1_start $path"reconhecedor_CETUC"/products/htk/mfccAURORA/model/hmm2_monophones $path"reconhecedor_CETUC"/products/htk/mfccAURORA/model/hmm3_triphones $path"reconhecedor_CETUC"/products/htk/mfccAURORA/model/hmm4_triphonesMultistream  $path"reconhecedor_CETUC"/products/htk/languageModel/AURORA $path"reconhecedor_CETUC"/products/htk/phonesAURORA/dictionaryCMU   $path"reconhecedor_CETUC"/resultsAURORA

echo "########################################################################################################"
echo "ATENTION: you should copy the database into the 'producsDatabase' folder, with the name 'DatabaseAURORA'"
echo "########################################################################################################"
echo ""
echo "your workstation is already this is the  path"
echo ""
tree $path"reconhecedor_CETUC"
