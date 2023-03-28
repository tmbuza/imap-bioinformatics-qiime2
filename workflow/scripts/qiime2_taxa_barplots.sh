qiime taxa barplot \
  --i-table qiime2_process/feature-table.qza \
  --i-taxonomy qiime2_process/taxonomy.qza \
  --m-metadata-file data/metadata/qiime2_metadata_file.tsv \
  --o-visualization qiime2_process/taxa-bar-plots.qzv
