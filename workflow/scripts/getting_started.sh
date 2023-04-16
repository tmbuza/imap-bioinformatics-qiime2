#!/bin/env bash

# Project directory
mkdir qiime2-atacama-tutorial
cd qiime2-atacama-tutorial

# Metadata
wget -O "sample_metadata.tsv" "https://data.qiime2.org/2023.2/tutorials/atacama-soils/sample_metadata.tsv"

# Multiplex reads
mkdir -p raw_data
     
wget -O "raw_data/forward.fastq.gz" "https://data.qiime2.org/2019.1/tutorials/atacama-soils/10p/forward.fastq.gz" 
wget -O "raw_data/reverse.fastq.gz" "https://data.qiime2.org/2019.1/tutorials/atacama-soils/10p/reverse.fastq.gz"  
wget -O "raw_data/barcodes.fastq.gz" "https://data.qiime2.org/2019.1/tutorials/atacama-soils/10p/barcodes.fastq.gz" 

# Inspect read quality
mkdir fastqc

fastqc -t 4 raw_data/*.fastq.gz -o fastqc

cd fastqc
multiqc .
cd ..

# Qiime2_artfact
qiime tools import \
    --type EMPPairedEndSequences \
    --input-path raw_data \
    --output-path raw_data/paired-end-sequences.qza

# Demultiplex the sequencing reads
qiime demux emp-paired \
    --m-barcodes-file sample-metadata.tsv \
    --m-barcodes-column BarcodeSequence \
    --i-seqs raw_data/paired-end-sequences.qza \
    --o-per-sample-sequences demux.qza \
    --p-rev-comp-mapping-barcodes

qiime demux summarize \
    --i-data demux.qza \
    --o-visualization demux.qzv

# # Get test subsample
# qiime demux subsample-paired \
#   --i-sequences demux-full.qza \
#   --p-fraction 0.3 \
#   --o-subsampled-sequences demux-subsample.qza

# qiime demux summarize \
#   --i-data demux-subsample.qza \
#   --o-visualization demux-subsample.qzv

# # Filtering samples with <=100 reads for demo purpose only
# qiime tools export \
#   --input-path demux-subsample.qzv \
#   --output-path ./demux-subsample/

# qiime demux filter-samples \
#   --i-demux demux-subsample.qza \
#   --m-metadata-file ./demux-subsample/per-sample-fastq-counts.tsv \
#   --p-where 'CAST([forward sequence count] AS INT) > 100' \
#   --o-filtered-demux demux.qza

# Trim sequences
qiime cutadapt trim-paired \
    --i-demultiplexed-sequences raw_data/demux-paired-end.qza \
    --p-cores 4 \
    --p-front-f GTGYCAGCMGCCGCGGTAA \
    --p-front-r GGACTACNVGGGTWTCTAAT \
    --p-discard-untrimmed \
    --p-no-indels \
    --o-trimmed-sequences raw_data/trimmed_paired-end.qza
 
qiime demux summarize \
    --i-data raw_data/trimmed_paired-end.qza \
    --o-visualization raw_data/trimmed_paired-end.qzv