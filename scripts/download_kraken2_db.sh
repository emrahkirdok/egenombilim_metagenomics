#!bin/sh

mkdir -p databases

wget -nc ftp://ftp.ccb.jhu.edu/pub/data/kraken2_dbs/old/minikraken2_v1_8GB_201904.tgz -R databases/

tar -xzf databases/minikraken2_v1_8GB_201904.tgz
