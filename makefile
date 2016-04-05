SHELL:=/bin/bash
DBTIMIT=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseTIMIT/*.txt
LMTIMIT=/home/christianlab/reconhecedor_CETUC/products/htk/languageModel/TIMIT/*
PHTIMIT=/home/christianlab/reconhecedor_CETUC/products/htk/phonesTIMIT/*.txt
MFCC=/home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/*.txt 
convDB=/home/christianlab/Documentos/Scripts_Reconhecedor/ConvertDatabases/DatabaseTIMIT/
LM=/home/christianlab/Documentos/Scripts_Reconhecedor/CreateLanguageModel/
PHN=/home/christianlab/Documentos/Scripts_Reconhecedor/CreatePhones/
MFCCTrain=/home/christianlab/Documentos/Scripts_Reconhecedor/LoadMFCCTrain/
MFCCTest=/home/christianlab/Documentos/Scripts_Reconhecedor/LoadMFCCTest/
HTKTRAIN=/home/christianlab/Documentos/Scripts_Reconhecedor/htkTrainAndTest/


all: cleanTIMIT convDataBaseTIMIT

cleanTIMIT:
	@ echo "delet all files to preparate script for speech recognition with TIMIT database"
	@ rm $(DBTIMIT)
	@ rm $(LMTIMIT)
	@ rm $(PHTIMIT)
	@ rm $(MFCC)
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/wordsInTrainSentencesTIMIT.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/TrainSentencesTIMIT.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/wordsInTestSentencesTIMIT.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/TestSentencesTIMIT.txt

convDataBaseTIMIT:
		@ echo "*** Clean data base files ***"
		@ rm $(DBTIMIT)
		@ echo "convert database and create monophones, dictionary, words and senteces files  from TIMIT database"
		sh $(convDB)make-run.sh

createLMTIMIT:
	@ echo "*** Clean languagem model files ***"
	@ rm $(LMTIMIT)
	@ echo "Start language model"
	sh $(LM)Script_LenguageModel_TIMIT.sh	

createPhoneTIMIT:
	@ echo "*** clean phones files ***"
	@ rm $(PHTIMIT)
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/wordsInTrainSentencesTIMIT.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/TrainSentencesTIMIT.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/wordsInTestSentencesTIMIT.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/TestSentencesTIMIT.txt
	@ sleep 10
	@ echo "make monophones"
	sh $(PHN)Script_CreatePhones_TIMIT.sh

loadMFCCTrain:
	@ echo "*** Clean MFCC train files ***"
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/proto.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/featureInfo.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/HCopyParametersForTrain.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/trainFeaturesFiles.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/trainWavAndFeaturesFiles.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/featuresTrain/*.feat
	@ sleep 10
	@ echo " Listing TIMIT train data"
	$(MFCCTrain)Script_LoadMFCCTrainInfo.sh

loadMFCCTest:
	@ echo "*** Clean MFCC test files ***"
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/testFeaturesFiles.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/testWavAndFeaturesFiles.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/HDecodeParameters.txt
	@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/featuresTest/*.feat
	@ sleep 10
	@ echo " Listing TIMIT test data"
	$(MFCCTest)Script_LoadMFCCTestInfo.sh


htkTrain:
	#@echo "*** Clean training files ***"
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm1_start/hmmdefs
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm1_start/macros
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm1_start/proto*
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm1_start/vFloors
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm2_monophones/hmmdefs
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm2_monophones/macros
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm3_triphones/hmmdefs
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm3_triphones/macros
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm4_triphonesMultistream/hmmdefs
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/model/hmm4_triphonesMultistream/macros
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/trees.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/triphonesTied.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/tiedStateConfiguration.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/statsFile.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/warnings.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/addMixtureConfiguration.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/phonesTIMIT/triphones1.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/phonesTIMIT/triphonesInTrainSentences1.txt
	#@ rm /home/christianlab/reconhecedor_CETUC/products/htk/phonesTIMIT/tiedLog.txt
	#@echo "*** training Speech recognition ***"
	$(HTKTRAIN)Script_TrainHTK.sh

htkTest:
	#@echo "*** Clean test files ***"
	#@rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/testResultsWords.txt
	#@rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/testRecognizedWords.txt
	#@rm /home/christianlab/reconhecedor_CETUC/products/htk/mfccTIMIT/testRecognizedWords2.txt
	@echo "*** evaluating results ***"
	$(HTKTRAIN)Script_TestHTK.sh  

