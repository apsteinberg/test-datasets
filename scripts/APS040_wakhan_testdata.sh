#!/bin/bash
#SBATCH --partition=componc_cpu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=36:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=nanoqc_filter
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=preskaa@mskcc.org
#SBATCH --output=slurm%j_3x3_nanoqc.out

# make subsampled tumor bam
colo_bam=/data1/shahs3/users/preskaa/test_datasets/colo829_2024.03/basecalls/colo829/sup/PAU59949.d052sup4305mCG_5hmCGvHg38.bam
chr=chr22
coords=33000000-34000000
region=${chr}:${coords}
colo_sub_bam=$HOME/test-datasets/bams/PAU59949.d052sup4305mCG_5hmCGvHg38.${chr}.bam
# subsample
samtools view -b ${colo_bam} ${region} > ${colo_sub_bam}
samtools index -b ${colo_sub_bam} -o ${colo_sub_bam}.bai
# do same for normal bam
norm_bam=/data1/shahs3/users/preskaa/test_datasets/colo829_2024.03/basecalls/colo829bl/sup/PAU61427.d052sup4305mCG_5hmCGvHg38.bam
norm_sub_bam=$HOME/test-datasets/bams/PAU61427.d052sup4305mCG_5hmCGvHg38.${chr}.bam
# subsample
samtools view -b ${norm_bam} ${region} > ${norm_sub_bam}
samtools index -b ${norm_sub_bam} -o ${norm_sub_bam}.bai
# subsample reference genome and index to match
# Extract just chr1 from reference
hg38=/data1/shahs3/reference/ref-sarcoma/GRCh38/v45/GRCh38.primary_assembly.genome.fa
sub_hg38=$HOME/test-datasets/reference/GRCh38_${chr}.fa
hg38_roi=$HOME/test-datasets/reference/GRCh38_${chr}_${coords}.fa
## full chromosome reference
samtools faidx ${hg38} ${chr} > ${sub_hg38}
samtools faidx ${sub_hg38} --fai-idx ${sub_hg38}.fai # Create index
# Extract the region and rename the header
samtools faidx ${hg38} ${region} | sed "s/^>${region}/>${chr}/" > ${hg38_roi}
samtools faidx ${hg38_roi}