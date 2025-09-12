# test-datasets: wakcna
This branch contains test data for [shahcompbio/wakcna](https://github.com/shahcompbio/wakcna)

# Bams

Bams are subsampled versions of the bams from the COLO829/COLO829BL tumor/normal benchmark dataset from ONT (see [here](https://epi2me.nanoporetech.com/colo-2024.03/))

the subsamples were created using samtools view:

```

samtools view -b tumor.bam chr1:10000000-15000000 > tumor_test_chr1.bam
samtools view -b normal.bam chr1:10000000-15000000 > normal_test_chr1.bam

# Index the subset BAMs
samtools index tumor_test_chr1.bam
samtools index normal_test_chr1.bam

```