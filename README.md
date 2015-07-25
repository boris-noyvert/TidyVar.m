# TidyVar.m
TidyVar - variant calling in next generation sequencing data.

TidyVar.m is a Wolfram Mathematica package for variant calling in next generation sequencing data. Requires Mathematica and Samtools and works only under Unix type operation systems (Linux, MacOS).

Output:

a VCF file.

Input:

1) Bam files (one bam file per sequenced individual) containing the NGS reads mapped to the genome. Each bam file must be sorted and indexed (look for Samtools help if you don't know what this means);

2) a FASTA file containing the genome reference sequence - must be the same reference file that you used when you mapped the reads.

3) (Optional) a BED file defining the regions to call variants in. Useful for targeted sequencing projects, like exome sequencing. TidyVar is faster to call variants in specified regions rather than in whole genome even if the majority of reads map to the targeted regions anyway.

4) (Optional) a single target region in the format "15:12345-16789". Useful if you sequenced a single consecutive region, or if you just want to try quickly on a small region if TidyVar works. This option can be combined with the bed file option above.

Details soon!
