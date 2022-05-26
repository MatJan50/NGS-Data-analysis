#!/bin/bash
mkdir ../mapping/stats
for (( i = 5; i <= 7; i++ ))
        do
        echo "Sorting..." 
        samtools sort "../mapping/SRR06454${i}.bam" -o "../mapping/SRR06454${i}.sorted.bam"
	samtools index "../mapping/SRR06454${i}.sorted.bam"

	echo "Saving stats..."
	samtools flagstat "../mapping/SRR06454${i}.sorted.bam" > "../mapping/stats/SRR06454${i}.flagstats"
done

