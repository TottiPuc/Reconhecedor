#! /bin/bash 

################################################
#==============================================#
##### Christian Dayan Arcos Gordillo  ##########
#####       Reconhecimento de voz      #########
#####     christian@cetuc.puc-rio.br    ########
#######       CETUC - PUC - RIO       ##########
#==============================================#
################################################


nameDatabase="AURORA"
DictionaryPath=~/reconhecedor_CETUC/productsDatabase/Database$nameDatabase/ConvertDataBase$nameDatabase/CMU_dictionary/dictionary5knvp.txt
SentencesPath=~/reconhecedor_CETUC/productsDatabase/Database$nameDatabase/ConvertDataBase$nameDatabase/trainList.txt
resultPath=~/reconhecedor_CETUC/productsDatabase/Database"$nameDatabase"

cat $DictionaryPath | 
tr -d "\r" |
sed '/;/d' |  
sed '/CLOSE-QUOTE/d' |
sed '/END-OF-QUOTE/d' |
sed '/END-QUOTE/d' |
sed '/IN-QUOTES/d' |
sed '/QUOTE/d' |
sed '/UNQUOTE/d' |
sed '/BEGIN-PARENS/d' |
sed '/IN-PARENTHESES/d' |
sed '/PAREN/d' |
sed '/PARENS/d' |
sed '/PARENTHESES/d' |
sed '/CLOSE-PARENTHESES/d' |
sed '/END-PAREN/d' |
sed '/END-PARENS/d' |
sed '/END-PARENTHESES/d' |
sed '/END-THE-PAREN/d' |
sed '/UN-PARENTHESES/d' |
sed '/FULL-STOP/d' |
sed "s/^'/\\\\'/g"|
#sed "s/^'/\\\\\\\\\'/g"|
sed -r '/simmer/ a simmered  s ih m axr d'|
sed 's/\///g'|
sed 's/\.//g'|
sed 's/1//g'|
sed 's/2//g'|
sed 's/!//g'|
sed 's/"//g'|
sed 's/#//g'|
sed 's/%//g'|
sed 's/&//g'|
sed 's/)//g'|
sed 's/(//g'|
sed 's/,//g'|
sed 's/://g'|
sed 's/?//g'|
sed 's/{//g'|
sed 's/}//g'|
sed 's/~n//g'|
sed 's/~v_past//g'|
sed 's/~v_pres//g'|
sed 's/~v//g'|
sed 's/~adj//g'|
sed 's/[1-9]//g'|
sed 's/()//g' |
sed -e '$a PHILIPPINES	F IH L IH P IY N Z'|
tr [[:upper:]] [[:lower:]] > $resultPath/dic.tmp

mv $resultPath/dic.tmp $resultPath/dictionary.txt

echo ""
echo "create new dictionary from phone transcriptions"
echo ""

cat $resultPath/dictionary.txt > $resultPath/dictionary2.tmp
cat $resultPath/dictionary.txt | sed 's/$/ sil/g' >> $resultPath/dictionary2.tmp
cat $resultPath/dictionary.txt | sed 's/$/ sp/g' >> $resultPath/dictionary2.tmp

echo "!SENT_START" >> $resultPath/dictionary2.tmp
echo "!SENT_END" >> $resultPath/dictionary2.tmp


cat $resultPath/dictionary2.tmp |sort |uniq > $resultPath/dictionary2.txt



echo ""
echo "*** make monopones files (without short pauses) and questions file ***"
echo ""

touch $resultPath/monophones.txt $resultPath/questions.txt
./create_phones_questions.sh

echo ""
echo "*** fix sentences list  ***"
echo ""

cat $SentencesPath |
sed "s/...................................$//g"|
sed 's/\.//g' |
sed 's/\?//g' |
sed 's/{//g' |
sed 's/}//g' |
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
#sed "s/ *$//g" |
tr [[:upper:]] [[:lower:]] > $resultPath/sentences.txt

echo ""
echo "*** remove all temporal files *.tmp  ***"
echo ""

rm -rf $resultPath/*.tmp



