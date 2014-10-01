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
		sentence=0

			ls $DRdir/$line1/*.WAV | while read line2
			do
			################################################################
			########### convert strange format .wav (sph) to ###############
			#########  microsoft wav, see the format with soxi  ############
			# Los documentos SPH son Archivos de audio asociados con SDR99 #
			##        Speech Recognition Task SPHERE Waveform.	   #####
			################################################################
			sox $line2 a.wav 
			sox a.wav -r 8000 $line1"_sentence"$sentence.wav
			mv $line1"_sentence"$sentence.wav $2/DatabaseComplet8KHz/Train/
			ls $line2
			echo "sentence number = $sentence";
			sentence=`expr $sentence + 1`
			done

			################################################################

                        ls $DRdir/$line1/*.PHN | while read line3
                        do
                        ################################################################
                        ########### convert strange format .wav (sph) to ###############
                        #########  microsoft wav, see the format with soxi  ############
                        ################################################################
                        ls $line3
			cat $line3 | 
			sed 's/h#/sil/g' | 
			sed '/bcl/d' |
			sed '/dcl/d' |
			sed '/gcl/d' |
			sed '/kcl/d' |
			sed '/pcl/d' |
			sed '/tcl/d' |
			sed '/epi/d' |
			sed '/q/d' > temporal.tmp
			cat temporal.tmp | while read line4
					do
					ec=`echo $line4 | awk '{print $3}'` 
					echo $ec
					if [ "$ec" != "$u" ] && [  "$ec" != "sp" ]
					then 
					echo 'bindooooooooooooooooo'  
		sleep 4s
			fi
			u= echo $ec	
echo $u		
			sleep 5s
			
			done
			#cat temporal2.tmp
			sleep 5s
                        echo "sentence number = $sentence";
                        sentence=`expr $sentence + 1`
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
