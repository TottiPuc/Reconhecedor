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

###############   main variables   ######################
decision="Yes"
in=$1
##########################################################

echo ""
echo "#####################  WARNING# ###########################"
echo "."
echo    "  vai sobrescrever as pastas de treinamento e teste 
                tem certeza disso?"
echo "se vc tem certeza digite sim caso contrario pressione Enter"
echo "."
echo "###########################################################"
echo ""
echo "Type Yes to continue or press Enter to exit: "

if [ ! -d $in ]; then
	echo "..erro.."
	echo "...informe o diretorio com os audios..."
	echo ""
	exit 999
fi

read digite
if [ "$digite" == "$decision" ]; then

	find $in -name "*.wv1" | while read line

	do
	sph2pipe -f wav $line >> $line.wav
	done

	find $in -name "*wv1.wav" | while read file

	do
	if [ "$file" != "${file/\.wv1\.wav/.wav}" ];then
		mv "$file" "${file/\.wv1\.wav/.wav}"
	else
		echo "Os áudios já tinham sido processados "
	fi
	done
	find $in -name "*.wv1" | while read file

	do
	rm  -rf "$file" 
	done

fi

