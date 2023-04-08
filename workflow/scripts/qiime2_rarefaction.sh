OUTDIR="qiime2_process"
METADATADIR="resources/metadata"

## Rarefaction
qiime diversity alpha-rarefaction \
  --i-table "${OUTDIR}"/feature-table.qza \
  --i-phylogeny "${OUTDIR}"/rooted-tree.qza \
  --p-max-depth 4000 \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/alpha-rarefaction.qzv
