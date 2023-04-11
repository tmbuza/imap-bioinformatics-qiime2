qiime diversity core-metrics-phylogenetic \
    --i-table Analysis/filtered/table_filt.qza \
    --i-phylogeny Analysis/phylogeny/rep_seqs_filt_aligned_masked_tree_rooted.qza \
    --p-sampling-depth 971 \
    --m-metadata-file sample-metadata.tsv \
    --output-dir Analysis/diversity

qiime tools export  \
    --input-path Analysis/filtered/rep_seqs_filt.qza  \
    --output-path Analysis/filtered/rep_seq_exported
