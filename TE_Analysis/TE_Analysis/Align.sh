#!/bin/bash

set -e
start='date *%s'

mkdir -p STAR_1st

for i in `find . -name "*_R1.fastq.gz" | sed 's/_R1.fastq.gz//'`
	do
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment begun <<<<<<<<<<<<<<<<<<<<"
		echo ""
		STAR --genomeDir /mnt/Scratch/Canine_transposons/CanFam3.1 \
    		--runMode alignReads \
		--readFilesIn $i\_R1.fastq.gz $i\_R2.fastq.gz \
		--readFilesCommand zcat \
		--outFileNamePrefix STAR_1st/`basename $i` \
    		--outFilterMultimapNmax 100 \ #NEW Default=10, read alignments will be output if the read maps fewer than this value otherwise no alignments will be output
		--winAnchorMultimapNmax 100 \ #NEW Default=50, max number of loci anchors are allowed to map to
		--outFilterMismatchNmax 3 \ #NEW Default=10, alignment will be output only if it has fewer mismatches than this value
		--alignEndsType EndToEnd \ #NEW Default=Local, EndToEnd - force end to end read alignment, do not soft-clip
		--alignIntronMax 0 \ #NEW Default=0, maximum intron size, if 0, max intron size will be determined by (2^winBinNbits)*winAnchorDistNbins
		--alignMatesGapMax 0 \ #NEW Default=0, maximum gap between two mates, if 0, max intron gap will be determined by (2^winBinNbits)*winAnchorDisNbins
		--seedSearchStartLmax 30 \ #NEW Default=50, defines the search start point through the read - the read is split into pieces no longer than this value
		--alignTranscriptsPerReadNmax 30000 \ #NEW Default=10000, max number of different alignments per read to consider
		--alignWindowsPerReadNmax 30000 \ #NEW Default=10000, max number of windows per read
		--alignTranscriptsPerWindowNmax 300 \ #NEW Default=100, max number of transcripts per window
		--seedPerReadNmax 3000 \ #NEW Default=1000, max number of seeds per read
		--seedPerWindowNmax 300 \ #NEW Default=50, max number of seeds per window
		--seedNoneLociPerWindow 1000 \ #NEW Default=10, max number of one seed loci per window
		--outSJfilterReads Unique \
		--outSAMtype BAM SortedByCoordinate --runThreadN 100
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment complete <<<<<<<<<<<<<<<<<<<<"
		echo ""
	done

# run featureCounts on ALL
featureCounts \
-p -g gene_name -t exon -M \
-a /mnt/Scratch/Canine_transposons/GCF_000002285.3_CanFam3.1_genomic.gtf \
-o Counts_stranded_gtf_TE.gene -F GTF -T 64 \
-s 0 \
STAR_1st/*.bam

# run featureCounts on ALL - Looking for RepeatMasker regions
featureCounts -M --fraction -F SAF -T 64 \
-s 0 \
-p -a canFam3.fa.out.SAF \
-o Counts_stranded_gtf_TE.gene \
STAR_1st/*.bam











end='date +%s'
runtime=&((end-start))
echo "Total Runtime = $runtime"
