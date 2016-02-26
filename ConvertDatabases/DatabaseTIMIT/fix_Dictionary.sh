#! /bin/bash 

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################

clear

nameDatabase="TIMIT"
DictionaryPath=~/reconhecedor_CETUC/OriginalDataBases$nameDatabase/Doc/TIMITDIC.TXT
resultPath=~/reconhecedor_CETUC/productsDatabase/Database"$nameDatabase"

cat $DictionaryPath | 
sed '/;/d' |  
sed -r '/bourgeois/ a bourgeoisie  b uh r zh w aa z iy'|
sed -r '/line/ a lined  l ay n d'|
sed -r '/simmer/ a simmered  s ih m axr d'|
sed -r '/teems/ a teeny  t iy n iy'|
sed 's/\///g'|
sed 's/\.//g'|
sed 's/1//g'|
sed 's/2//g'|
sed 's/~n//g'|
sed 's/~v_past//g'|
sed 's/~v_pres//g'|
sed 's/~v//g'|
sed 's/~adj//g'|
sed '/^$/d' > $resultPath/dic.tmp

mv $resultPath/dic.tmp $resultPath/dictionary.txt

echo ""
echo "create new dictionary from phone transcriptions"
echo ""

#touch $resultPath/phones.tmp $resultPath/word.tmp


ls $resultPath/DatabaseComplet8KHz/Train/*.phn.txt > $resultPath/phones.tmp
ls $resultPath/DatabaseComplet8KHz/Train/*.wrd.txt > $resultPath/words.tmp


#ls $resultPath/DatabaseComplet8KHz/Train/*.phn.txt | while read phone
#do
#	cat $phone | sed '/sil/d' | sed '/sp/d' >> $resultPath/phones.tmp
#done 

#ls $resultPath/DatabaseComplet8KHz/Train/*.wrd.txt | while read word
#do
#	cat $word >> $resultPath/word.tmp
	
#done
##ls $resultPath/DatabaseComplet8KHz/Train/*.wrd.txt 

./Creat_Dictionary2.py $resultPath/words.tmp $resultPath/phones.tmp $resultPath/dictionary2.tmp










