qiime empress community-plot \
    --i-tree qiime2_process/rooted-tree.qza \
    --i-feature-table qiime2_process/feature-table.qza \
    --m-sample-metadata-file qiime2_process/sample-metadata.tsv \
    --m-feature-metadata-file qiime2_process/taxonomy.qza \
    --o-visualization qiime2_process/tree.qzv \
    --p-filter-missing-features \
    --p-ignore-missing-samples