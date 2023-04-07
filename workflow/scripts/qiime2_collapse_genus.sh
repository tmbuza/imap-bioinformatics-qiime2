OUTDIR="qiime2_process"

echo PROGRESS: Collapsing feature table to Genus-level
# qiime taxa collapse
qiime taxa collapse \
--i-table "${OUTDIR}"/feature-table.qza \
--i-taxonomy "${OUTDIR}"/taxonomy.qza \
--p-level 6 \
--o-collapsed-table "${OUTDIR}"/feature-table-genus.qza

