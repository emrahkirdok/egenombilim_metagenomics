#!/bin/bash

#SBATCH -A egitim20
#SBATCH --res=egitim
#SBATCH -p barbun
#SBATCH -n 20
#SBATCH -N1
#SBATCH --time=3:00:00

source /truba/home/egitim20/.bashrc

mkdir -p results/kraken2

zcat data/ERR*.fastq.gz | kraken2 /dev/stdin --use-names --threads 20 --db databases/minikraken2_v1_8GB/ --report results/kraken2/Sythlom_report.txt --output results/kraken2/Sythlom_sequences.txt --classified-out results/kraken2/Sythlom_classified_sequences.fastq
