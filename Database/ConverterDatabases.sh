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
			#######################  starting1   ##########################
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
			#########################  end1  ###############################
			####################### starting2  #############################

                        ls $DRdir/$line1/*.PHN | while read line3
                        do
                        ################################################################
                        ############### fix phone files and copy them ##################
                        #########                                           ############
                        ################################################################

                        ls $line3
			cat $line3 | 
			sed 's/h#/sil/g' |    # replace header #
			sed 's/#h/sil/g' |

			################  ignore those phones  ##########################

			sed '/bcl/d' |
			sed '/dcl/d' |
			sed '/gcl/d' |
			sed '/kcl/d' |
			sed '/pcl/d' |
			sed '/tcl/d' |
			sed '/epi/d' |
			sed '/q/d' |

			#####################   raplace phones   ########################

			sed 's/eng/ih/g'|
			sed 's/nx/n/g'  |
			sed 's/dx/d/g'  |
			sed 's/hv/hh/g' |
			sed 's/ux/uw/g' |
			sed 's/ax-h/ax/g'|
			sed 's/pau/sil/g' > temporal.tmp
			touch $line1"_sentence"$sentence.phn

			###################   ignore duplicated short pause  ###########

			cat temporal.tmp | while read line4
					do
					phone=`echo $line4 | awk '{print $3}'` 
					#echo "Ultimo phone armazenado$lastphone"
					#echo primero phone $phone
						if [ "$phone" = "$lastphone" ] && [  "$phone" = "sp" ]
						then 
						echo linha  duplicada de curta pausa apagada $line4  
						sleep 4s
						else 
						echo "$line4" >> $line1"_sentence"$sentence.phn
						fi
					lastphone=`echo $phone`	
					#echo "ultimo phone armazenado $lastphone"		
					done
			#sleep 5s
			mv $line1"_sentence"$sentence.phn $2/DatabaseComplet8KHz/Train/
                        echo "sentence number = $sentence";
                        sentence=`expr $sentence + 1`
                        done
			
			############################  end2  ##############################
			##########################  starting3   ##########################

			ls $DRdir/$line1/*.TXT | while read line5
                        do
			
			################################################################
                        ##### remove initial number and puntuation  from sentence ######
                        #########    files also replaces ''em' to '\'em'    ############
			########## also convert all characters to lowercase   ##########
                        ################################################################			
			ls $line5
                        cat $line5 |
                        sed 's/[0-9]//g' |   # remove numbers 
                        sed 's/^ *//g' |     # remove whitespaces 
			tr 'A-Z' 'a-z' |     # convert all characters to lowercase
                        sed 's/\.//g' |    
                        sed 's/\,//g' |    
                        sed 's/\?//g' |    
                        sed 's/\!//g' |    
                        sed 's/\://g' |    
                        sed 's/\;//g' |    
                        sed 's/\"//g' |    
                        sed 's/\--//g' |    
                        sed 's/'\''em/\\'\''em/g' > temporal2.tmp    
			
                        mv temporal2.tmp  $2/DatabaseComplet8KHz/Train/$line1"_sentence"$sentence.stc
                        echo "sentence number = $sentence";
                        sentence=`expr $sentence + 1`
                        done

		echo "speaker number for data= $speakerforpasta"
		speakerforpasta=`expr $speakerforpasta + 1`	
		done 
#sleep 2s
echo "Final da conversão"
done

#sleep 2s

#find $1/Train -name "*.WAV" | while read line 
#do

#echo "processando arquivo $line"


#done

#echo "$1/Train"
#echo "$2/DatabaseComplete8KHz/Train"
