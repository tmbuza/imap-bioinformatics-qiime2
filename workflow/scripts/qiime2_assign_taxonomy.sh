CLASSIFIER="resources/gg_classifier"
OUTPUT="qiime2_process"

### Classifying sequences
qiime feature-classifier classify-sklearn \
  --i-classifier "${CLASSIFIER}"/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads "${OUTPUT}"/rep-seqs.qza \
  --o-classification "${OUTPUT}"/taxonomy.qza \
  --verbose

## Visualizing taxonomy classification
qiime metadata tabulate \
  --m-input-file "${OUTPUT}"/taxonomy.qza \
  --o-visualization "${OUTPUT}"/taxonomy.qzv
