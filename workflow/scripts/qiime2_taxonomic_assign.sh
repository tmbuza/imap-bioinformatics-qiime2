### Classifying sequences
time qiime feature-classifier classify-sklearn \
  --i-classifier $PWD/resources/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads $PWD/qiime2_process/rep-seqs.qza \
  --o-classification $PWD/qiime2_process/taxonomy.qza

## Visualizing taxonomy classification
qiime metadata tabulate \
  --m-input-file $PWD/qiime2_process/taxonomy.qza \
  --o-visualization $PWD/qiime2_process/taxonomy.qzv

# qiime tools view $PWD/qiime2_process/taxonomy.qzv
