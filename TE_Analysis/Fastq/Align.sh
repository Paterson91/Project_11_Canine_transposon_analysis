#!/bin/bash

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
    		--outSJfilterReads Unique \
		--outSAMtype BAM SortedByCoordinate --runThreadN 100
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment complete <<<<<<<<<<<<<<<<<<<<"
		echo ""
	done
