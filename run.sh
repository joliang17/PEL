#!/bin/bash

#SBATCH --job-name=pel
#SBATCH --output=pel.out.%j
#SBATCH --error=pel.out.%j
#SBATCH --time=24:00:00
#SBATCH --account=scavenger 
#SBATCH --partition=scavenger
#SBATCH --gres=gpu:rtxa5000:1
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G



# checking gpu status
nvidia-smi

# cd ../..
source /fs/nexus-scratch/yliang17/miniconda3/bin/activate diffu

# run PEL on ImageNet-LT
python main.py -d imagenet_lt -m clip_vit_b16_peft

# # run PEL on Places-LT
# python main.py -d places_lt -m clip_vit_b16_peft

# # run PEL on iNaturalist 2018
# python main.py -d inat2018 -m clip_vit_b16_peft num_epochs 20