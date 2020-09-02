STAR --runMode genomeGenerate \
--runThreadN 100 \
--genomeDir /mnt/Scratch/Canine_transposons/TE_Analysis/CanFam3.1_TE \
--genomeFastaFiles /mnt/Scratch/Canine_transposons/TE_Analysis/CanFam3.1_edit.fa \
--limitGenomeGenerateRAM 500000000000 \
--sjdbGTFfile /mnt/Scratch/Canine_transposons/TE_Analysis/GCF_000002285.3_CanFam3.1_genomic_chrNames.gtf \
--sjdbOverhang 74
