#!/bin/bash
#PBS -l nodes=1:ppn=12:thinnode,walltime=96:00:00
#PBS -W group_list=cu_10027 -A cu_10027
#PBS -N atac
#PBS -m n
#PBS -j eo
#PBS -V

# Load required modules
module load java/1.8.0
module load samtools/1.5
module load bcftools/1.5
module load bowtie2/2.3.2
module load bedtools/2.26.0
module load macs2
module load htslib/1.5
module load vt/0.5772
module load ghostscript/9.16
module load R
module load perl
module load cutadapt/1.14

cd $PBS_O_WORKDIR

# Fetch ATAC-Seq script
ATACSCRIPT=${1}
shift

# Run analysis pipeline
ls ${ATACSCRIPT}
${ATACSCRIPT} $@
