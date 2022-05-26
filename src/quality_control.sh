#!/bin/bash
cd ../original_files/
for (( i = 5; i <= 7; i++ ))
        do
        echo "Checking quality with Fastp" 
        fastp -i "SRR06454${i}_1.fastq.gz" -I "SRR06454${i}_2.fastq.gz" -o "SRR06454${i}_1.fastp.fastq.gz" -O "SRR06454${i}_2.fastp.fastq.gz" -h "SRR06454${i}.html"
done
mkdir quality_control
mv *fastp.fastq.gz ../quality_control/
mv *.html ../quality_control
echo Done 
