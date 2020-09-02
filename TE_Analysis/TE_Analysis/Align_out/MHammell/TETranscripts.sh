TEtranscripts -c 1-3d-Control-run1Aligned.sortedByCoord.out.bam \
3-3d-Control-run2Aligned.sortedByCoord.out.bam \
5-3d-Control-run3_S1Aligned.sortedByCoord.out.bam \
-t 2-3d-TET-run1Aligned.sortedByCoord.out.bam \
4-3d-TET-run2_S6Aligned.sortedByCoord.out.bam \
6-3d-TET-run3_S5Aligned.sortedByCoord.out.bam \
--GTF ../GCF_000002285.3_CanFam3.1_genomic_chrNames.gtf \
--format BAM \
--mode multi \
--sortByPos \
--TE canFam3.1_rpmskr.all.sorted.gtf

