echo PROGRESS: Performing denovo clustering with 99% perc-identity.

qiime vsearch cluster-features-de-novo \
  --i-table $PWD/qiime2_process/feature-table.qza \
  --i-sequences $PWD/qiime2_process/rep-seqs.qza \
  --p-perc-identity 0.99 \
  --o-clustered-table $PWD/qiime2_process/feature-table-dn-99.qza \
  --o-clustered-sequences $PWD/qiime2_process/rep-seqs-dn-99.qza

# qiime feature-table tabulate-seqs \
#   --i-data $PWD/qiime2_process/rep-seqs-dn-99.qza \
#   --o-visualization $PWD/qiime2_process/rep-seqs-dn-99.qzv

# # qiime tools view $PWD/qiime2_process/rep-seqs-dn-99.qzv

