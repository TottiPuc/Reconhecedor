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

IN=/home/christianlab/reconhecedor_CETUC/products/htk
OUT=/home/christianlab/reconhecedor_CETUC/products/htk/phonesAURORA

#julia prompts2wlist.jl $IN/TrainSentencesAURORA.txt $OUT/dicAcusticModelAurora.tmp

#cat $OUT/dicAcusticModelAurora.tmp | sed '/./!d' > $OUT/dicAcusticModelAurora.txt

# se tiene que hacer la transcripcion fonetica manualmente en DMU dictionary toolbox despues si fizar el diccionario

cat $OUT/dic_AM_AURORA.txt |
tr -d "\r" |
sed 's/\t/  /g'|
sed '/#/d' |
sed '/./!d'|
sed 's/\///g'|
sed 's/\.//g'|
sed 's/1//g'|
sed 's/2//g'|
sed 's/[1-9]//g'|
sed 's/()//g' |
sed -e '$a PHILIPPINES  F IH L IH P IY N Z' |
sed -e '$a PHILIPS  F IH L AH P S' |
sed -e '$a PURCHASING  P ER CH AH S IH NG' |
sed -e '$a ROUTE  R AW T' |
sed -e '$a ROUTE  R UW T' |
sed -e '$a ROUTINE  R UW T IY N' |
sed -e '$a ROVER  R OW V ER' |
tr [[:upper:]] [[:lower:]] | sort | uniq > $OUT/dictionaryAM.txt








