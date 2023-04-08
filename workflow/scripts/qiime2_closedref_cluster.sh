echo PROGRESS: Performing closed ref clustering with refs from "https://data.qiime2.org/2023.5/tutorials/otu-clustering/85_otus.qza"

qiime vsearch cluster-features-closed-reference \
  --i-table $PWD/qiime2_process/feature-table.qza \
  --i-sequences $PWD/qiime2_process/rep-seqs.qza \
  --i-reference-sequences $PWD/resources/gg_classifier/85_otus.qza \
  --p-perc-identity 0.85 \
  --o-clustered-table $PWD/qiime2_process/table-cr-85.qza \
  --o-clustered-sequences $PWD/qiime2_process/rep-seqs-cr-85.qza \
  --o-unmatched-sequences $PWD/qiime2_process/unmatched-cr-85.qza

# qiime feature-table tabulate-seqs \
#   --i-data $PWD/qiime2_process/rep-seqs-cr-85.qza \
#   --o-visualization $PWD/qiime2_process/rep-seqs-cr-85.qzv

# # qiime tools view $PWD/qiime2_process/rep-seqs-cr-99.qzv
