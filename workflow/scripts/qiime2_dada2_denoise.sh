echo PROGRESS: Denoising, dereplicating, and filtering chimeras

# time qiime dada2 denoise-single \
#     --i-demultiplexed-seqs qiime2_process/demux.qza \
#     --p-trunc-len 0 \
#     --o-table qiime2_process/feature-table.qza \
#     --o-representative-sequences qiime2_process/rep-seqs.qza \
#     --o-denoising-stats qiime2_process/stats.qza \
#     --verbose
# qiime tools import 
# --type 'SampleData[SequencesWithQuality]'\
# --input-path metadata.tsv\
# --output-path single-end-demux.qza\
# --input-format SingleEndFastqManifestPhred33V2

# qiime demux summarize 
# --i-data single-end-demux.qza\
# --o-visualization single-end-demux.qzv

# qiime dada2 denoise-single 
# --i-demultiplexed-seqs single-end-demux.qza\
# --p-trunc-len 200\
# --p-chimera-method consensus\
# --output-dir DADA2_denoising_output\
# --verbose


time qiime dada2 denoise-paired \
    --i-demultiplexed-seqs qiime2_process/demux-subsample.qza \
    --p-trunc-len-f 200 \
    --p-trunc-len-r 200 \
    --p-trim-left-f 0 \
    --p-trim-left-r 0 \
    --p-max-ee-f 2 \
    --p-max-ee-r 2 \
    --p-trunc-q 2 \
    --p-min-overlap 12 \
    --p-pooling-method 'independent'\
    --p-chimera-method 'consensus'\
    --p-min-fold-parent-over-abundance 1.0 \
    --p-allow-one-off False \
    --p-n-threads 1 \
    --p-n-reads-learn  10000 \
    --o-table qiime2_process/feature-table.qza \
    --o-representative-sequences qiime2_process/rep-seqs.qza \
    --o-denoising-stats qiime2_process/stats.qza \
    --verbose


# qiime dada2 denoise-single \
#     --i-demultiplexed-seqs se-demux.qza \
#     --p-trunc-len 200 \
#     --p-chimera-method consensus \
#     --output-dir DADA2_denoising_output \
#     --verbose


# Ref: https://rpubs.com/katerinka/qiime2-tutorial