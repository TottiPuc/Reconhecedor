#! /bin/bash 

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################

pathTrainFile=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA/csr_1_senn_d2/11-13.1/wsj0/doc/indices/train/tr_s_wv1.ndx
TrainFiles=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA/csr_1_senn_d1/
pathTrainSource=~/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseComplete8kHz

if [ -d $pathTrainSource ]; then
	rm -r $pathTrainSource
fi

#sentence=1
mkdir -p $pathTrainSource/Train $pathTrainSource/Test

# delete sentences adaptatives
find /home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA/promp_train_si_tr_s/ -name *.ptx  | sed '/a0100/d' | while read line
do
cat $line | sed '/./!d' >> $pathTrainSource/promptx.tmp
done

cat $pathTrainFile |sed '/;/d'| sed 's/.wv1//g' | sed '/11_2_1:wsj0\/si_tr_s\/401\//d' | cut -d / -f 4 > $pathTrainSource/list.tmp

fgrep -f $pathTrainSource/list.tmp $pathTrainSource/promptx.tmp > $pathTrainSource/trainList.tmp

cat $pathTrainSource/trainList.tmp | sed 's/exisiting/existing/g' > trainList.txt



cat $pathTrainFile |sed '/;/d'| sed 's/wv1/wav/g' | sed '/11_2_1:wsj0\/si_tr_s\/401\//d'| sed 's/_/-/' | sed 's/_/\./' | sed 's/:/\//' | sed "s|^|$TrainFiles|g" | while read line
do
speaker=`echo $line | cut -d "/" -f 12` 
sentence=`echo $line | cut -d "/" -f 13 | sed 's/.wav//g'`
#echo "sentence"$sentence"_speaker"$speaker".wav"
sox $line -r 8000 $pathTrainSource/Train/speaker"$speaker"_sentence"$sentence".wav
cat $pathTrainSource/trainList.txt | grep $sentence > $pathTrainSource/Train/speaker"$speaker"_sentence"$sentence".txt
#sentence=`expr $sentence + 1`
done

