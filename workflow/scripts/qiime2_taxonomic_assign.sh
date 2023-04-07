CLASSIFIER="resources"
OUTPUT="qiime2_process"

### Classifying sequences
time qiime feature-classifier classify-sklearn \
  --i-classifier "${CLASSIFIER}"/silva-138.1-ssu-nr99-seqs-515f-806r.qza \
  --i-reads "${OUTPUT}"/rep-seqs.qza \
  --o-classification "${OUTPUT}"/taxonomy.qza

## Visualizing taxonomy classification
qiime metadata tabulate \
  --m-input-file "${OUTPUT}"/taxonomy.qza \
  --o-visualization "${OUTPUT}"/taxonomy.qzv

# qiime tools view $PWD/qiime2_process/taxonomy.qzv

# qiime feature-classifier classify-sklearn \
#   --i-classifier "${CLASSIFIER}"/gg-13-8-99-515-806-nb-classifier.qza \
#   --i-reads "${OUTPUT}"/rep-seqs.qza \
#   --o-classification "${OUTPUT}"/taxonomy.qza

# qiime metadata tabulate \
#   --m-input-file "${OUTPUT}"/taxonomy.qza \
#   --o-visualization "${OUTPUT}"/taxonomy.qzv