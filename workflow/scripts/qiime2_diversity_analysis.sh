OUTDIR=qiime2_process
METADATADIR="resources/metadata"

## Alpha diversity
qiime diversity alpha-rarefaction \
  --i-table "${OUTDIR}"/feature-table.qza \
  --i-phylogeny r"${OUTDIR}"/rooted-tree.qza \
  --p-max-depth 4000 \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization alpha-rarefaction.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics-results/faith_pd_vector.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/core-metrics-results/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics-results/evenness_vector.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/core-metrics-results/evenness-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity "${OUTDIR}"/core-metrics-results/shannon_vector.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --o-visualization "${OUTDIR}"/core-metrics-results/shannon_group-significance.qzv

## Beta diversity
qiime diversity beta-group-significance \
  --i-distance-matrix "${OUTDIR}"/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --m-metadata-column BodySite \
  --o-visualization "${OUTDIR}"/core-metrics-results/unweighted-unifrac-body-site-significance.qzv \
  --p-pairwise

qiime diversity beta-group-significance \
  --i-distance-matrix "${OUTDIR}"/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --m-metadata-column Subject \
  --o-visualization "${OUTDIR}"/core-metrics-results/unweighted-unifrac-subject-group-significance.qzv \
  --p-pairwise

## Phylogenetic diversity
qiime diversity core-metrics-phylogenetic \
  --i-phylogeny "${OUTDIR}"/rooted-tree.qza \
  --i-table "${OUTDIR}"/feature-table.qza \
  --p-sampling-depth 1109 \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --output-dir "${OUTDIR}"/core-metrics-results

## Explore beta diversity metrics
#first, use the unweighted unifrac data as input
qiime emperor plot \
  --i-pcoa "${OUTDIR}"/core-metrics-results/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --p-custom-axes time \
  --o-visualization "${OUTDIR}"/core-metrics-results/unweighted-unifrac-emperor-time.qzv

#now repeat with bray curtis
qiime emperor plot \
  --i-pcoa "${OUTDIR}"/core-metrics-results/bray_curtis_pcoa_results.qza \
  --m-metadata-file "${METADATADIR}"/qiime2_metadata_file.tsv \
  --p-custom-axes time \
  --o-visualization "${OUTDIR}"/core-metrics-results/bray-curtis-emperor-time.qzv
