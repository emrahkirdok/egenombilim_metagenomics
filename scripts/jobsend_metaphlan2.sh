#!/bin/bash

#SBATCH -A egitim20
#SBATCH --res=egitim
#SBATCH -p barbun
#SBATCH -n 20
#SBATCH -N1
#SBATCH --time=3:00:00

source /truba/home/egitim20/.bashrc

echo "hello world" > result.txt
