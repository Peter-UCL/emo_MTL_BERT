#!/bin/bash -l

#$ -S /bin/bash

#$ -N MTL_4_tasks_ES_SE18_ELEP_ELFR

#$ -l h_rt=35:0:0

#$ -l gpu=1

#$ -l mem=20G








pip install torch torchvision tqdm pytorch_pretrained_bert tensorboardX --user
pip install -e $1/EmoMTLExperiments/metal --user

/usr/bin/time --verbose python $1/EmoMTLExperiments/3_BERT_MTL/1_MTL_Tasks/TrainAndEvalMTL.py --max_seq_length=100 --batch_size=32 --data_path=$1/EmoMTLExperiments/1_Datasets/1_Create_datasets/data/ --task_list=ES,SE18,ELEPContext,ELFRContext --results_output=$1/EmoMTLExperiments/3_BERT_MTL/3_More_Tasks/4_Four_Tasks/ES_SE18_ELEP_ELFR_results --model_name=ES_SE18_ELEP_ELFR --num_pretraining_epochs=25 --num_finetune_epochs=5
