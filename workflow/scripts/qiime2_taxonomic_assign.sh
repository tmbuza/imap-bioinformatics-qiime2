### Classifying sequences
time qiime feature-classifier classify-sklearn \
  --i-classifier $PWD/resources/silva-138.1-ssu-nr99-tax.qza \
  --i-reads $PWD/qiime2_process/rep-seqs.qza \
  --o-classification $PWD/qiime2_process/taxonomy.qza

## Visualizing taxonomy classification
qiime metadata tabulate \
  --m-input-file $PWD/qiime2_process/taxonomy.qza \
  --o-visualization $PWD/qiime2_process/taxonomy.qzv

# qiime tools view $PWD/qiime2_process/taxonomy.qzv
