OUTDIR="qiime2_process"

qiime taxa barplot \
  --i-table "${OUTDIR}"/feature-table.qza \
  --i-taxonomy "${OUTDIR}"/taxonomy.qza \
  --m-metadata-file "${OUTDIR}"/sample-metadata.tsv \
  --o-visualization "${OUTDIR}"/taxa-bar-plots.qzv