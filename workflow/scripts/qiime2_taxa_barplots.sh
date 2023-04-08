OUTDIR="qiime2_process"
METADATADIR="resources/metadata"

qiime taxa barplot \
  --i-table "${OUTDIR}"/feature-table.qza \
  --i-taxonomy "${OUTDIR}"/taxonomy.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/taxa-bar-plots.qzv