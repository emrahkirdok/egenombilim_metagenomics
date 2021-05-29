#!/bin/bash

#SBATCH -A egitim20
#SBATCH --res=egitim
#SBATCH -p barbun
#SBATCH -n 4
#SBATCH -N1
#SBATCH --time=3:00:00

source /truba/home/egitim20/.bashrc

mkdir -p results/streptococcus

zcat data/*gz | /truba/home/egitim20/Admin/emrah/seqfilter -i /dev/stdin -o results/streptococcus/s_pneumoniae.fastq  -l results/kraken2/streptococcus_pneumoniae_ids.txt
