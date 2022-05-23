#!/bin/bash
cd ../mapping/
bwa index ../saccharomyces_reference_genome.fna.gz
for (( i = 5; i <= 7; i++ ))
        do
        echo "Indexing..." 
        bwa aln -t 4 ../saccharomyces_reference_genome.fna.gz "../quality_control/SRR06454${i}_1.fastp.fastq.gz" "../quality_control/SRR06454${i}_2.fastp.fastq.gz" > "../mapping/SRR06454${i}.sai"
	bwa samse ../saccharomyces_reference_genome.fna.gz "../mapping/SRR06454${i}.sai" "../quality_control/SRR06454${i}_1.fastp.fastq.gz" "../quality_control/SRR06454${i}_2.fastp.fastq.gz" | \
	samtools view -Sb > "../mapping/SRR06454${i}.bam"

done

