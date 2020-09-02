for i in `find /mnt/Scratch/Canine_transposons/Fastq/. -name "*_R1_TRIMMED.fastq.gz" | sed 's/_R1_TRIMMED.fastq.gz//'`
	do
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment begun <<<<<<<<<<<<<<<<<<<<"
		echo ""
		STAR --genomeDir /mnt/Scratch/Canine_transposons/TE_Analysis/CanFam3.1_TE \
		--runMode alignReads \
		--readFilesIn $i\_R1_TRIMMED.fastq.gz $i\_R2_TRIMMED.fastq.gz \
		--readFilesCommand zcat \
		--outFileNamePrefix Align_out/`basename $i` \
    		--outFilterMultimapNmax 100 \
		--outSAMtype BAM SortedByCoordinate --runThreadN 100
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i 1st Pass Alignment complete <<<<<<<<<<<<<<<<<<<<"
		echo ""
	done
