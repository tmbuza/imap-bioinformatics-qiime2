OUTDIR="qiime2_process"

## Rarefaction
qiime diversity alpha-rarefaction \
  --i-table "${OUTDIR}"/feature-table.qza \
  --i-phylogeny "${OUTDIR}"/rooted-tree.qza \
  --p-max-depth 4000 \
  --m-metadata-file "${OUTDIR}"/sample-metadata.tsv \
  --o-visualization "${OUTDIR}"/alpha-rarefaction.qzv