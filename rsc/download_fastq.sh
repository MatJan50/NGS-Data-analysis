#!/bin/bash
cd ../original_files/
for (( i = 5; i <= 7; i++ ))
	do
	echo "Hold on..."  
	fastq-dump -X 1000000 "SRR06454$i" --split-3 --gzip
done
echo Done 
