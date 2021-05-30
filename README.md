---
title : "5700 yaşındaki çiğnenmiş sakızın metagenomik öyküsü"
author: "Tanya Beril Korkmaz, Şevval Aktürk, Yasemin Karakaş, Mert Peker ve Emrah Kırdök"
date: "Mayıs 29, 2021"

---


## Giriş

Bu prpje kapsamında, Jensen et al 2019 makalesinde elde edilen sonuçların bir kısmı incelenecektir. Genel olark:

1. DNA dosyalarının indirilmesi
2. Metaphlan2 aracı ile analiz
3. Kraken2 aracı ile analiz
4. Metaphlan2 sonuçlarını insan mikrrobiomu ile karşılaştırılması
5. Kraken2 sonuçlarından S. pneumoniae bakterisine ait dizilerin bulunması
6. Dizileri referans genom ile hizalama
7. PMDtools aracı ile deaminasyon profillerinin oluşturulması
8. Sonuç dosyalarının bilgisayarlara indirilmesi ve rapor yazılması

### Dosyaların indirilmesi

DNA dosyaların indirmek için:

```
./scripts/download_files.sh
```


Kraken2 veritabanının indirilmesi

```
./scripts/download_kraken2_db.sh
```

### Metaphlan2 ile metagenomik profilleme

Şu komutu kullanın:

``` 
sbatch scripts/jobsend_metaphlan2.sh
```

son

### Kraken2 ile taksonomik sınıflandırma

İş göndermek için:


```
sbatch scripts/jobsend_kraken2.sh
```

## Kraken2 sonuçlarına bakalım

Üç tane dosya:

- Sythlom_report.txt
- Sythlom_sequences.txt
- Sythlom_classified_sequences.fastq


Rapor dosyasındaki türleri alalım:

``` 
awk -F"\t" '$2 > 100 && $4 == "S" ' results/kraken2/Sythlom_report.txt > results/kraken2/Sythlom_turler.txt
``` 
Streptococcue pneumoniae ile eşleşmiş DNA dizilerinin etiketlerini alalım:


``` 
grep "Streptococcus pneumoniae" results/kraken2/Sythlom_sequences.txt | cut -f 2 > results/kraken2/streptococcus_pneumoniae_ids.txt
``` 

Son olarak, bu dizileri DNA kütüphanelerinden elde edelim

```
sbatch scripts/jobsend_extract_sequences.sh
``` 

Ve referans genoma hizalayalım:

``` 
sbatch scripts/jobsend_align.sh
``` 

BAM dosyasından deaminasyon profillerini elde edelim. [PMDTools aracını indirmek için bu bağlantı](https://github.com/pontussk/PMDtools)

``` 
cd results/streptococcus
 
samtools view s_pneumoniae.bam | python2.7 /home/egitim20/Admin/emrah/PMDtools/pmdtools.0.60.py --deamination > PMD_temp.txt
``` 
