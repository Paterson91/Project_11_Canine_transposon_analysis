# run featureCounts on ALL
featureCounts \
-p -g Parent -t exon \
-a /mnt/Scratch/Canine_transposons/GCF_000002285.3_CanFam3.1_genomic.gff \
-o Counts_stranded.gene -F GFF -T 64 \
-s 0 \
*.bam
