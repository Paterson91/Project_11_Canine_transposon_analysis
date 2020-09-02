#!/bin/bash

mkdir -p STAR_1st_trim

for i in `find . -name "*_R1_TRIMMED.fastq.gz" | sed 's/_R1_TRIMMED.fastq.gz//'`
	do
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment begun <<<<<<<<<<<<<<<<<<<<"
		echo ""
		STAR --genomeDir /mnt/Scratch/Canine_transposons/CanFam3.1 \
    		--runMode alignReads \
		--readFilesIn $i\_R1_TRIMMED.fastq.gz $i\_R2_TRIMMED.fastq.gz \
		--readFilesCommand zcat \
		--outFileNamePrefix STAR_1st_trim/`basename $i` \
    		--outSJfilterReads Unique \
		--outSAMtype BAM SortedByCoordinate --runThreadN 60
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment complete <<<<<<<<<<<<<<<<<<<<"
		echo ""
	done
