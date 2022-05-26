#!/bin/bash
mkdir ../vcfs/
for (( i = 5; i <= 7; i++ ))
        do
        echo "Variant calling..." 
        bcftools mpileup -Ou -f ../mapping/saccharomyces_reference_genome.fna.gz "../mapping/SRR06454${i}.sorted.bam" | bcftools call --ploidy 1 -mv -Ob | bcftools view -i '%QUAL>=20' > "../vcfs/SRR06454$i.bcf"
done

