#! /bin/bash 

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################

pathTestFile=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA/csr_1_senn_d2/11-13.1/wsj0/doc/indices/Test/nvp/si_et_05.ndx
TestFiles=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA/csr_1_senn_d2/
pathTestSource=~/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseComplete8kHz/Test
TestRaw=~/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA

if [ -d $pathTestSource ]; then
	rm -r $pathTestSource
fi

#sentence=1
mkdir -p $pathTestSource

# delete sentences adaptatives
find /home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/ConvertDataBaseAURORA/promp_test_nvp_si_et_05/ -name *.ptx  | while read line
do
cat $line | sed '/./!d' >> $TestRaw/promptxTest.tmp
done

cat $pathTestFile |sed '/;/d'| cut -d / -f 4 > $TestRaw/listTest.tmp

fgrep -f $TestRaw/listTest.tmp $TestRaw/promptxTest.tmp > $TestRaw/TestList.txt



cat $pathTestFile |sed '/;/d'| sed 's/_/-/' | sed 's/_/\./' | sed 's/:/\//' | sed "s|^|$TestFiles|g" | while read line
do
audio=`echo $line".wav"`
speaker=`echo $line | cut -d "/" -f 12` 
sentence=`echo $line | cut -d "/" -f 13`
#sox $line -r 8000 $pathTrainSource/Train/speaker"$speaker"_sentence"$sentence".wav   # se for convertir pra 8kz desde o começo tire o # dessa linha e comente a seguinte
#cp $audio $pathTestSource/speaker"$speaker"_sentence"$sentence".wav   # se for convertir pra 8kz desde o começo comente essa linha e descomente a linha de emcima
cat $TestRaw/TestList.txt | grep $sentence > $pathTestSource/speaker"$speaker"_sentence"$sentence".txt
#sentence=`expr $sentence + 1`
done

find $pathTestSource/ -name *.txt | while read line
do
cat $line | awk '{ $(NF)=""; print }' | awk '{ $(NF)=""; print }'|
#sed "s/...................................$//g"|
sed 's/\.//g' |
sed 's/\?//g' |
sed 's/{//g' |
sed 's/}//g' |
sed 's/!//g' |
sed 's/%//g' |
sed 's/&//g' |
sed 's/\///g' |
sed 's/\://g' |
sed 's/\;//g' |
sed 's/\,//g' |
sed 's/\"//g' |
sed 's/\--//g' |
sed "s/'em/\\\'em/g" |
sed "s/(*)*//g" |
tr [[:upper:]] [[:lower:]] > $line.stc.txt
done






