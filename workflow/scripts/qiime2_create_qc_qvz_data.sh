echo PROGRESS: Exploring QC results

qiime metadata tabulate \
  --m-input-file qiime2_process/stats.qza \
  --o-visualization qiime2_process/stats.qzv

## Visualizing output
# qiime tools view $PWD/qiime2_process/stats.qzv


qiime feature-table summarize \
  --i-table qiime2_process/feature-table.qza \
  --o-visualization qiime2_process/feature-table.qzv \
  # --m-sample-metadata-file qiime2_process/q2-sample-metadata.qzv

## Visualizing output
# qiime tools view $PWD/qiime2_process/feature-table.qzv


qiime feature-table tabulate-seqs \
  --i-data qiime2_process/rep-seqs.qza \
  --o-visualization qiime2_process/rep-seqs.qzv

## Visualizing output
# qiime tools view $PWD/qiime2_process/rep-seqs.qzv
