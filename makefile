SHELL:=/bin/bash
#############################################################################################
PATHSCRIPTS=`pwd`
PATHPRODUCTOS=/home/christianlab/reconhecedor_CETUC
PATHPRODUCTOSCORRUPTED=/home/christianlab/reconhecedor_CETUC/productsDatabase/DatabaseAURORA/DatabaseCorrupted8kHz/Test/
#############################################################################################
#****************************** products **************************************************#

DBTIMIT=$(PATHPRODUCTOS)/productsDatabase/DatabaseTIMIT/*.txt
DBAURORA=$(PATHPRODUCTOS)/productsDatabase/DatabaseAURORA/*.txt
LMTIMIT=$(PATHPRODUCTOS)/products/htk/languageModel/TIMIT/*
PHTIMIT=$(PATHPRODUCTOS)/products/htk/phonesTIMIT/*.txt
PHAURORA=$(PATHPRODUCTOS)/products/htk/phonesAURORA/*.txt
MFCC=$(PATHPRODUCTOS)/products/htk/mfccTIMIT/*.txt 

#############################################################################################
#******************************** scripts **************************************************#

convDB=$(PATHSCRIPTS)/ConvertDatabases
LM=$(PATHSCRIPTS)/CreateLanguageModel/
PHN=$(PATHSCRIPTS)/CreatePhones/
MFCCTrain=$(PATHSCRIPTS)/LoadMFCCTrain/
MFCCTest=$(PATHSCRIPTS)/LoadMFCCTest/
HTKTRAIN=$(PATHSCRIPTS)/htkTrainAndTest/

#############################################################################################
#*********************************  clean Sripts  ******************************************#
all: cleanTIMIT convDataBaseTIMIT

cleanTIMIT:
	@ echo "delet all files to preparate scripts for speech recognition with TIMIT database"
	@ rm convDataBaseTIMIT
	@ rm createLMTIMIT
	@ rm createPhoneTIMIT
	@ rm loadMFCCTrainTIMIT
	@ rm loadMFCCTestTIMIT
	@ rm htkTrainTIMIT
	@ rm htkTestTIMIT
	

cleanAURORA:
	@ echo "delet all files to preparate scripts for speech recognition with AURORA database"
	@ rm convDataBaseAURORA
	@ rm createLMAURORA
	@ rm createPhoneAURORA
	@ rm loadMFCCTrainAURORA
	@ rm loadMFCCTestAURORA
	@ rm htkTrainAURORA
	@ rm htkTestAURORA	

##############################################################################################
#******************************** convert Databases  ****************************************#

convDataBaseTIMIT:
		@ echo "*** Clean data base files ***"
		@ rm $(DBTIMIT)
		@ echo "convert database and create monophones, dictionary, words and senteces files  from TIMIT database"
		@ $(convDB)/DatabaseTIMIT/make-run.sh $(PATHPRODUCTOS) $(PATHSCRIPTS)
		@ touch $@

convDataBaseAURORA:
		@ echo "*** Clean data base files ***"
	#	@ rm $(DBAURORA)
		@ echo "convert database and create monophones, dictionary, words and senteces files  from AURORA database"
		@ $(convDB)/DatabaseAURORA/make-run.sh $(PATHPRODUCTOS) $(PATHSCRIPTS)
		@ touch $@

################################################################################################
#********************************* make Language models ***************************************#

createLMTIMIT:
	@ echo "*** Clean languagem model files ***"
	@ rm $(LMTIMIT)
	@ echo "Start language model"
	@ $(LM)Script_LenguageModel_TIMIT.sh $(PATHPRODUCTOS) $(PATHSCRIPTS)	
	@ touch $@

createLMAURORA:
	@ echo "*** take the LM from original AURORA database (baseline) ***"
	@ cp $(PATHPRODUCTOS)/productsDatabase/DatabaseAURORA/LM_AURORA/tcb05cnp $(PATHPRODUCTOS)/products/htk/languageModel/AURORA/
	@ mv $(PATHPRODUCTOS)/products/htk/languageModel/AURORA/tcb05cnp $(PATHPRODUCTOS)/products/htk/languageModel/AURORA/trigrams.tmp
	@ cat $(PATHPRODUCTOS)/products/htk/languageModel/AURORA/trigrams.tmp | tr [[:upper:]] [[:lower:]] > $(PATHPRODUCTOS)/products/htk/languageModel/AURORA/trigrams.txt
	@ rm -r $(PATHPRODUCTOS)/products/htk/languageModel/AURORA/trigrams.tmp 
	@ touch $@

################################################################################################
#*********************************  make monophones  ******************************************#

createPhoneTIMIT:
	@ echo "*** clean phones files ***"
	@ rm $(PHTIMIT)
	@ rm $(PATHPRODUCTOS)/products/htk/wordsInTrainSentencesTIMIT.txt
	@ rm $(PATHPRODUCTOS)/products/htk/TrainSentencesTIMIT.txt
	@ rm $(PATHPRODUCTOS)/products/htk/wordsInTestSentencesTIMIT.txt
	@ rm $(PATHPRODUCTOS)/products/htk/TestSentencesTIMIT.txt
	@ sleep 10
	@ echo "make monophones"
	@ $(PHN)Script_CreatePhones_TIMIT.sh $(PATHPRODUCTOS) $(PATHSCRIPTS)
	@ touch $@

createPhoneAURORA:
	@ echo "*** clean phones files ***"
	@ rm $(PHAURORA)
	@ rm $(PATHPRODUCTOS)/products/htk/wordsInTrainSentencesAURORA.txt
	@ rm $(PATHPRODUCTOS)/products/htk/TrainSentencesAURORA.txt
	@ rm $(PATHPRODUCTOS)/products/htk/wordsInTestSentencesAURORA.txt
	@ rm $(PATHPRODUCTOS)/products/htk/TestSentencesAURORA.txt
	@ sleep 10
	@ echo "make monophones"
	@ $(PHN)Script_CreatePhones_AURORA.sh $(PATHPRODUCTOS) $(PATHSCRIPTS)
	@ touch $@

###################################################################################################
#********************************** feature train extraction  ************************************#

loadMFCCTrainTIMIT:
	@ echo "*** Clean MFCC train files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/proto.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/featureInfo.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/HCopyParametersForTrain.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/trainFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/trainWavAndFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/featuresTrain/*.feat
	@ sleep 10
	@ echo " Listing TIMIT train data"
	@ $(MFCCTrain)Script_LoadMFCCTrainInfo.sh $(PATHPRODUCTOS)
	@ touch $@


loadMFCCTrainAURORA:
	@ echo "*** Clean MFCC train files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/proto.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/featureInfo.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/HCopyParametersForTrain.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/trainFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/trainWavAndFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/featuresTrain/*.feat
	@ sleep 10
	@ echo " Listing AURORA train data"
	@ $(MFCCTrain)Script_LoadMFCCTrainInfoAURORA.sh $(PATHPRODUCTOS)
	@ touch $@



####################################################################################################
#********************************** feature Test extraction  **************************************#

loadMFCCTestTIMIT:
	@ echo "*** Clean MFCC test files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/testFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/testWavAndFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/HDecodeParameters.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/featuresTest/*.feat
	@ sleep 10
	@ echo " Listing TIMIT test data"
	@ $(MFCCTest)Script_LoadMFCCTestInfo.sh $(PATHPRODUCTOS)
	@ touch $@


loadMFCCTestAURORA:
	@ echo "*** Clean MFCC test files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testWavAndFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/HDecodeParameters.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/featuresTest/*.feat
	@ sleep 10
	@ echo " Listing AURORA test data"
	@ $(MFCCTest)Script_LoadMFCCTestInfoAURORA.sh $(PATHPRODUCTOS)
	@ touch $@

loadMFCCTestAURORACorrupted:
	@ echo "*** Clean MFCC test files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testWavAndFeaturesFiles.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/HDecodeParameters.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/featuresTest/*.feat
	@ sleep 3
	@ echo " Listing AURORA test data"
	@ $(MFCCTest)Script_LoadMFCCTestInfoAURORAcorrupted.sh $(PATHPRODUCTOS) $(DATA) #$(PATHPRODUCTOSCORRUPTED)
	@ touch $@

###################################################################################################
#*********************************** train recognizer ********************************************#

htkTrainTIMIT:
	@echo "*** Clean training files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm1_start/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm1_start/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm1_start/proto*
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm1_start/vFloors
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm2_monophones/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm2_monophones/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm3_triphones/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm3_triphones/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm4_triphonesMultistream/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/model/hmm4_triphonesMultistream/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/trees.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/triphonesTied.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/tiedStateConfiguration.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/statsFile.txt
	@ rm $(PATHPRODUCTOS)/products/htk/warnings.txt
	@ rm $(PATHPRODUCTOS)/products/htk/addMixtureConfiguration.txt
	@ rm $(PATHPRODUCTOS)/products/htk/phonesTIMIT/triphones1.txt || true
	@ rm $(PATHPRODUCTOS)/products/htk/phonesTIMIT/triphonesInTrainSentences1.txt || true
	@ rm $(PATHPRODUCTOS)/products/htk/phonesTIMIT/tiedLog.txt || true    # por que son eliminados  en la creacion de los phones
	@ echo "*** training Speech recognition with TIMIT ***"
	@ $(HTKTRAIN)Script_TrainHTK.sh $(PATHPRODUCTOS)
	@ touch $@

htkTrainAURORA:
	@echo "*** Clean training files ***"
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm1_start/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm1_start/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm1_start/proto*
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm1_start/vFloors
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm2_monophones/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm2_monophones/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm3_triphones/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm3_triphones/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm4_triphonesMultistream/hmmdefs
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/model/hmm4_triphonesMultistream/macros
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/trees.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/triphonesTied.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/tiedStateConfiguration.txt
	@ rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/statsFile.txt
	@ rm $(PATHPRODUCTOS)/products/htk/warningsAURORA.txt
	@ rm $(PATHPRODUCTOS)/products/htk/addMixtureConfigurationAURORA.txt
	@ rm $(PATHPRODUCTOS)/products/htk/phonesAURORA/triphones1.txt || true
	@ rm $(PATHPRODUCTOS)/products/htk/phonesAURORA/triphonesInTrainSentences1.txt || true
	@ rm $(PATHPRODUCTOS)/products/htk/phonesAURORA/tiedLog.txt || true
	@ echo "*** training Speech recognition with AURORA ***"
	@ $(HTKTRAIN)Script_TrainHTK_AURORA.sh $(PATHPRODUCTOS)
	@ touch $@

####################################################################################################
#************************************** test recognizer *******************************************#

htkTestTIMIT: 
	@echo "*** Clean test files TIMIT ***"
	@rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/testResultsWords.txt
	@rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/testRecognizedWords.txt
	@rm $(PATHPRODUCTOS)/products/htk/mfccTIMIT/testRecognizedWords2.txt
	@echo "*** evaluating results TIMIT ***"
	@$(HTKTRAIN)Script_TestHTK.sh  $(PATHPRODUCTOS)
	@touch $@

htkTestAURORAclean: 
	@echo "*** Clean test files AURORA ***"
	@rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testResultsWords.txt
	@rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testRecognizedWords.txt
	@rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testRecognizedWords2.txt
	@echo "*** evaluating results AURORA ***"
	@$(HTKTRAIN)Script_TestHTK_AURORA.sh $(PATHPRODUCTOS) 
	@touch $@

htkTestAURORAcorrupted: 
	@echo "*** Clean test files AURORA ***"
	@rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testResultsWords.txt
	@rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testRecognizedWords.txt
	@rm $(PATHPRODUCTOS)/products/htk/mfccAURORA/testRecognizedWords2.txt
	@echo "*** evaluating results AURORA ***"
	@$(HTKTRAIN)Script_TestHTK_AURORACorrupted.sh $(PATHPRODUCTOS) $(DATA) #$(PATHPRODUCTOSCORRUPTED)
	@touch $@





