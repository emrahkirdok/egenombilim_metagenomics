#!/bin/bash

#SBATCH -A egitim20
#SBATCH --res=egitim
#SBATCH -p barbun
#SBATCH -n 20
#SBATCH -N1
#SBATCH --time=3:00:00

source /truba/home/egitim20/.bashrc

zcat data/*.fastq.gz | metaphlan2 /dev/stdin --input_type fastq --nproc 20 -s res 

