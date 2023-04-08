echo PROGRESS: Performing denovo clustering with refs from "https://data.qiime2.org/2023.5/tutorials/otu-clustering/85_otus.qza"

qiime vsearch cluster-features-open-reference \
  --i-table $PWD/qiime2_process/feature-table.qza \
  --i-sequences $PWD/qiime2_process/rep-seqs.qza \
  --i-reference-sequences $PWD/resources/gg_classifier/85_otus.qza \
  --p-perc-identity 0.85 \
  --o-clustered-table $PWD/qiime2_process/table-or-85.qza \
  --o-clustered-sequences $PWD/qiime2_process/rep-seqs-or-85.qza \
  --o-new-reference-sequences $PWD/qiime2_process/new-ref-seqs-or-85.qza

# qiime feature-table tabulate-seqs \
#   --i-data $PWD/qiime2_process/rep-seqs-or-85.qza \
#   --o-visualization $PWD/qiime2_process/rep-seqs-or-85.qzv
  
# # qiime tools view $PWD/qiime2_process/rep-seqs-or-99.qzv

