echo PROGRESS: Denoising, dereplicating, and filtering chimeras

time qiime dada2 denoise-paired \
    --i-demultiplexed-seqs qiime2_process/demux.qza \
    --p-trunc-len-f 0 \
    --p-trunc-len-r 0 \
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
    --p-n-reads-learn  100000 \
    --o-table qiime2_process/feature-table.qza \
    --o-representative-sequences qiime2_process/rep-seqs.qza \
    --o-denoising-stats qiime2_process/stats.qza \
    --verbose