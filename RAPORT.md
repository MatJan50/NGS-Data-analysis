# Description of NGS analysis

First step was to download 1 000 000 reads from all the runs from SRP003355 project in SRA database:
https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP003355&o=acc_s%3Aa
It was done using fastq-dump, saved to already zipped files.

Second step- quality check done with fastp
https://github.com/OpenGene/fastp
It was chosen due to it's simplicity- in one run there are generated quality reports in html and json as well as trimmed files.

Third step- mapping with bwa aligner. 
