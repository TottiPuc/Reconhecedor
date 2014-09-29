#! /bin/bash

###############  variavel Principal ######################
nameDatabase="TIMIT"
Train_Teste=~/reconhecedor_CETUC/OriginalDataBases"$nameDatabase"
ProductsDatabas=~/reconhecedor_CETUC/productsDatabase/Database"$nameDatabase"
decision="sim"
##########################################################
echo ""
echo "#####################  WARNING# #######################"
echo "."
echo    "  vai sobrescrever as pastas de treinamento e teste 
	        tem certeza disso?"
echo "se vc tem certeza digite sim caso contrario  digite nao"
echo "."
echo "#######################################################"

read digite

if [ "$digite" == "$decision" ]; then
echo "#######################################################"
echo "."
echo "  Criando Pastas de treinamento, testes
	e arquivos de configuração"
echo "."
echo "#######################################################"
rm -rf $Train_Teste $ProductsDatabas
mkdir -p  $Train_Teste $ProductsDatabas
mkdir -p  $Train_Teste/Train $Train_Teste/Test $Train_Teste/Doc
mkdir -p  $ProductsDatabas/DatabaseComplet8KHz/Train/ $ProductsDatabas/DatabaseComplet8KHz/Test/ $ProductsDatabas/DatabaseComplet8KHz/smallTest/  
touch  $ProductsDatabas/monophones.txt $ProductsDatabas/dictionary.txt $ProductsDatabas/dictionary2.txt $ProductsDatabas/questions.txt $ProductsDatabas/sentences.txt
clear
echo "..."
echo " Copinado arquivos dos bancos de dados originais"
echo "..."
gcp ~/Documentos/OriginalDatabases/timitComplete/DOC/*  ~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Doc
gcp -r  ~/Documentos/OriginalDatabases/timitComplete/TEST/*  ~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Test
gcp -r ~/Documentos/OriginalDatabases/timitComplete/TRAIN/*  ~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Train

else
echo "  Saida com sucesso nada a ser feito..."
fi 
sh ConverterDatabases.sh $Train_Teste $ProductsDatabas
