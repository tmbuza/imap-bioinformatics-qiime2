OUTDIR=qiime2_process
METADATADIR="resources/metadata"

#filter based on body site
qiime feature-table filter-samples \
  --i-table "${OUTDIR}"/feature-table.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --p-where "BodySite='gut'" \
  --o-filtered-table "${OUTDIR}"/gut-table.qza


qiime composition add-pseudocount \
  --i-table "${OUTDIR}"/gut-table.qza \
  --o-composition-table "${OUTDIR}"/comp-gut-table.qza


#now run ANCOM
qiime composition ancom \
  --i-table "${OUTDIR}"/comp-gut-table.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --m-metadata-column time \
  --o-visualization "${OUTDIR}"/ancom-time.qzv
