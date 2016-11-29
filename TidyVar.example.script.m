(* This script can be run in Linux like this: *)
(* math -script TidyVar.example.script.m *)

(* Directory where TidyVar files are located. *)
(* If the current file is in the same directory then don't change the line below *)
scriptdir=DirectoryName[$InputFileName];

(* Load the TidyVar package *)
Get[FileNameJoin[{scriptdir,"TidyVar.m"}]];

(* Print out the Mathematica version information *)
WriteString["stdout","Using Wolfram Mathematica. Version ", $Version, "\n"];

(* Check that samtools is installed *)
(* If Samtools is not found, you may need to install Samtools *)
(* or (if you believe it is installed) define SamtoolsPath in Mathematica like this: *)
(* SamtoolsPath="/path/to/software/" *)
CheckSamtoolsIsInstalled[SamtoolsPath];

(* Directory where test data is located. *)
datadir = FileNameJoin[{scriptdir, "test/"}];

(* Specify genome fasta file *)
GenomeFastaFile = FileNameJoin[{datadir, "genome.fa"}];
CheckFileExistence[GenomeFastaFile];

(* Specify bam files and check if they are indexed *)
(* Here you should define the names of (sorted and indexed) bam files containing the reads. *)
(* One bam file per individual please! *)
(* You can specify the names in Mathematica list like {"sample1.bam", "sample2.bam", ...} *)
(* or in the format understood by Unix 'ls' command like in the example below: *)
bamfiles = FileNameJoin[{datadir, "*.bam"}];
CheckBamFiles[bamfiles];

(* Specify target bed file and/or region for variant calling *)
(* If your data is from targeted enrichment capture (like exome sequencing) then please specify the name of a file in bed format that contains the target genomic coordinates. You may specify an empty string "" if this is a whole genome sequencing data or you are interested in a particular region defined in the targetregion variable below. *)
targetbedfile = FileNameJoin[{datadir, "targets.bed"}];

(* If you targeted a continuous genomic region or you want to run TidyVar on a specific region only you may specify the region below. You can use an empty string if there is no region to specify. One can define both the target bed file and the target region - an overlap of the region and the targets in the bed file will be evaluated in this case. Make sure that you use the same chromosome label conventions as in your fasta and bam files! *)
targetregion = "";

(* Specify the output vcf file *)
outputvcffile = FileNameJoin[{datadir, "variants.vcf"}];

WriteString["stdout", DateString[],"\tStarted variant calling\n"];

(* Run variant calling *)
(* You can change different options using the format option -> parameter like ExtendTargetsBy -> 100 below *)
nvar=CallVariants[bamfiles, outputvcffile, targetbedfile, targetregion, ExtendTargetsBy -> 100];

WriteString["stdout", "====================== Found ",nvar," variants ======================\n"];
  
WriteString["stdout", DateString[],"\tFinished variant calling\n"];