OUTDIR=qiime2_process
METADATADIR="resources/metadata"

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics/faith_pd_vector.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/core-metrics/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics/evenness_vector.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/core-metrics/evenness-group-significance.qzv