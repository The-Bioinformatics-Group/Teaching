#$ -cwd
#$ -q sandbox
#$ -pe mpi
#$ -S /bin/bash

module load Megahit/v1.1.4

# Kmere value: must be and odd number in the range 15-255. 
# Make sure that the read length is longer than the kmer value.
KMER=99

# Name of the analysis. Will prefix the output filenames.
SAMPLE="test_99"

# Input files in fastq format.
FILE1=/db/Teaching/Assembly/Kordia/MPL/KordiaSMS9_MPL_1.fastq
FILE2=/db/Teaching/Assembly/Kordia/MPL/KordiaSMS9_MPL_2.fastq

# Run the assembly analysis
megahit --k-list $KMER -1 $FILE1 -2 $FILE2 -t $NSLOTS -o ${SAMPLE} --out-prefix ${SAMPLE} --keep-tmp-files
# ...and save the assembly graph to a file.
megahit_toolkit contig2fastg $KMER ${SAMPLE}/intermediate_contigs/k${KMER}.contigs.fa > k${KMER}.fastg
