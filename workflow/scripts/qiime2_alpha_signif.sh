
OUTDIR="qiime2_process"

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics/faith_pd_vector.qza \
  --m-metadata-file "${OUTDIR}"/sample-metadata.tsv \
  --o-visualization "${OUTDIR}"/core-metrics/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics/evenness_vector.qza \
  --m-metadata-file "${OUTDIR}"/sample-metadata.tsv \
  --o-visualization "${OUTDIR}"/core-metrics/evenness-group-significance.qzv