#! /bin/bash 

###############  variavel Principal ######################
baseFolderPath="$1"
destinationFolderPath="$2"
##########################################################

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "Transformando a formato .wav"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
ls $1/Train | while read line 
do 
DRdir="$1/Train/$line"
speakerforpasta=1
		ls $DRdir | while read line1
		do
		echo "processando $line1"
		echo "..."
		sentence=1
			#while [ $sentence -lt 5 ]; do

			ls $DRdir/$line1/*.WAV | while read line2
			do
		
			ls $line2
	#		sleep 1s
			echo "sentence number = $sentence";
			sentence=`expr $sentence + 1`
			#done
			done

		echo "speaker number for data= $speakerforpasta"
		speakerforpasta=`expr $speakerforpasta + 1`	
		done 
sleep 2s
echo "Final da conversão"
done

#sleep 2s

#find $1/Train -name "*.WAV" | while read line 
#do

#echo "processando arquivo $line"


#done

#echo "$1/Train"
#echo "$2/DatabaseComplete8KHz/Train"
