#!/bin/bash

#SBATCH -A egitim20
#SBATCH --res=egitim
#SBATCH -p barbun
#SBATCH -n 20
#SBATCH -N1
#SBATCH --time=3:00:00

source /truba/home/egitim20/.bashrc

cd results/streptococcus

cp /truba/home/egitim20/Admin/emrah/GCF_000006885.1_ASM688v1_genomic.fna .

bwa index GCF_000006885.1_ASM688v1_genomic.fna

bwa mem GCF_000006885.1_ASM688v1_genomic.fna s_pneumoniae.fastq | samtools view -F4 -Sb > s_pneumoniae.bam

