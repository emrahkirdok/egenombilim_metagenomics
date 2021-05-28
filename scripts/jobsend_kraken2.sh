#!/bin/bash

#SBATCH -A egitim20
#SBATCH --res=egitim
#SBATCH -p barbun
#SBATCH -n 20
#SBATCH -N1
#SBATCH --time=3:00:00

source /truba/home/egitim20/.bashrc

zcat ../data/ERR*.fastq.gz | kraken2 /dev/stdin --use-names --threads 20 --db ../databases/minikraken2_v1_8GB/ --report sample_report.txt --output sample_sequences.txt
