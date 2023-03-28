# Multiple alignment
qiime alignment mafft \
  --i-sequences $PWD/qiime2_process/rep-seqs.qza \
  --o-alignment $PWD/qiime2_process/aligned-rep-seqs.qza

# Mask poor alignment
qiime alignment mask \
  --i-alignment $PWD/qiime2_process/aligned-rep-seqs.qza \
  --o-masked-alignment $PWD/qiime2_process/masked-aligned-rep-seqs.qza

# Visualizing masked alignments
qiime feature-table tabulate-seqs \
  --i-data $PWD/qiime2_process/masked-aligned-rep-seqs.qza \
  --o-visualization $PWD/qiime2_process/masked-aligned-rep-seqs.qzv

