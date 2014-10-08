#! /bin/bash

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################

###############  Configuration variables  ######################
nameDatabase="$1"
Train_Teste="$2"
ProductsDatabas="$3"
###############################################################
echo ""
echo "###########################################################"
echo "."
echo "  Criando Pastas de treinamento, testes
	e arquivos de configuração"
echo "."
echo "###########################################################"
rm -rf $Train_Teste $ProductsDatabas
mkdir -p  $Train_Teste $ProductsDatabas
mkdir -p  $Train_Teste/Train $Train_Teste/Test $Train_Teste/Doc
mkdir -p  $ProductsDatabas/Train/ $ProductsDatabas/Test/ $ProductsDatabas/smallTest/  
#touch  $ProductsDatabas/monophones.txt $ProductsDatabas/dictionary.txt $ProductsDatabas/dictionary2.txt $ProductsDatabas/questions.txt $ProductsDatabas/sentences.txt
clear
echo "..."
echo " Copinado arquivos dos bancos de dados originais"
echo "..."
cp ~/Documentos/OriginalDatabases/timitComplete/DOC/*  ~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Doc
cp -r  ~/Documentos/OriginalDatabases/timitComplete/TEST/*  ~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Test
cp -r ~/Documentos/OriginalDatabases/timitComplete/TRAIN/*  ~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Train
echo""

