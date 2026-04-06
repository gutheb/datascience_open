#!/bin/bash
#------------------------
#SBATCH --account=gratis
#------------------------
#SBATCH --job-name="tdatasc_kinase"
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=7
#SBATCH --mem-per-cpu=1G
#SBATCH --partition=gpu
#SBATCH --gres=gpu:rtx4090:2

# Your code below this line
module load Anaconda3
eval "$(conda shell.bash hook)"
conda activate kinaseenv

jupyter nbconvert --to notebook --execute \
    --ExecutePreprocessor.kernel_name=kinaseenv \
    /storage/homefs/hg21b070/datasc_kinase/kinaseforubelix.ipynb --output kinaseforubelix_out.ipynb