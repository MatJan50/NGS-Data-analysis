# Description of NGS analysis

1) Download 1 000 000 reads from all the runs from SRP003355 project in SRA database:  
https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP003355&o=acc_s%3Aa  
Script for downloading:  
https://github.com/MatJan50/AnalizaDanych/blob/ff0ee003d9eeb67fd7b82931919f1cbfc3134021/src/download_fastq.sh

2) Quality check done with fastp   
https://github.com/OpenGene/fastp  
It was chosen due to it's simplicity- in one run there are generated quality reports in html and json as well as trimmed files.  
Script for qc:     
https://github.com/MatJan50/AnalizaDanych/blob/ff0ee003d9eeb67fd7b82931919f1cbfc3134021/src/quality_control.sh  
QC html raports:  
/AnalizaDanych/quality_control/

3) Indexing and mapping with bwa aln and sampe aligner for paired reads.  
http://bio-bwa.sourceforge.net/bwa.shtml  
Additionaly, script uses samtools for changing memory demanding SAM file for its binary substitute in BAM.  
http://www.htslib.org/doc/samtools-view.html  
Script for mapping:  
https://github.com/MatJan50/AnalizaDanych/blob/ff0ee003d9eeb67fd7b82931919f1cbfc3134021/src/mapping.sh  

4) Post alignment processing, sorting (http://www.htslib.org/doc/samtools-sort.html) and indexing (http://www.htslib.org/doc/samtools-index.html) using samtools. Sorting places reads according to their coordinates and indexing extracts alignments overlapping particular genomic regions.   

5) mpileup from bcftools allows us to generate genotype likelihood for alignments (https://samtools.github.io/bcftools/bcftools.html#mpileup). Later, bcftools call makes the actual variant calling, as it stands in bcftools variant calling manual (https://samtools.github.io/bcftools/howtos/variant-calling.html). Last step filters vcf for reads with quality greater than certain threshold, set there for 20.    
Script for variant calling:  
https://github.com/MatJan50/AnalizaDanych/blob/ff0ee003d9eeb67fd7b82931919f1cbfc3134021/src/variant_calling.sh

Last step was to use snpEff (http://pcingola.github.io/SnpEff/se_introduction/) using database R64-1-1.70 and R64-1-1.99. built for Saccharomyces cerevisiae. Unfortunately, neither of these were able to identify chromosomes properly in bcf files. Example file can be found here:  
https://github.com/MatJan50/AnalizaDanych/blob/a4e62b2cbb144862ef604a1771ff18c406bbe05d/vcfs/SRR064545.ann.bcf    

