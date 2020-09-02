#!/bin/bash

parallel --gnu gunzip -v ::: *gz

for i in `find . -name "*.fastq" -o -name "*fq" ! -name "*sorted*"| sed 's/.fastq//'`
	do
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i Sort begun <<<<<<<<<<<<<<<<<<<<"
		echo ""
    		nohup cat $i\.fastq | paste - - - - | sort -k1,1 -t " " | tr "\t" "\n" > $i\_sorted.fastq
    		echo ""
    		echo ">>>>>>>>>>>>>>>>>>>> $i Sort complete <<<<<<<<<<<<<<<<<<<<"
    		echo ""
	done

pigz -v *_sorted.fastq
