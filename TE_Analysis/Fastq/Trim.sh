#!/bin/bash

if find . -name "*.fq" -o -name "*.fastq" -o -name "*.fastq.gz" -o -name "*.fq.gz" | grep -q "." ; then
  echo "Input Files:"
  echo ""
  INPUT_READS=$(find . -name "*_R1_*.fq" -o -name "*_R1_*.fastq" -o -name "*_R1.fastq.gz" -o -name "*_R1_*.fastq.gz" -o -name "*_R1_*.fq.gz" -o -name "*_1.fq.gz" -maxdepth 1)
  echo $INPUT_READS
  for i in `ls $INPUT_READS | sed 's/_R1.fastq.gz//'`
  do
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i Trimming begun <<<<<<<<<<<<<<<<<<<<<<"
		echo ""
		/usr/bin/bbmap/bbduk.sh \
		in1=$i\_R1.fastq.gz \
		in2=$i\_R2.fastq.gz \
		out1=$i\_R1_TRIMMED.fastq.gz \
		out2=$i\_R2_TRIMMED.fastq.gz \
		ref=/usr/bin/bbmap/resources/adapters.fa \
		tpe tbo
		echo ">>>>>>>>>>>>>>>>>>> $i Trimming Complete <<<<<<<<<<<<<<<<<<<<"
		echo ""
	done
  command; echo "Trimming Complete" | mail -s "Trimming Complete" a.paterson@bristol.ac.uk
else
  print "No FastQ files found"
fi
