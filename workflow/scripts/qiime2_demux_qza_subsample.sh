qiime demux subsample-paired \
  --i-sequences qiime2_process/demux.qza \
  --p-fraction 0.15 \
  --o-subsampled-sequences qiime2_process/demux-subsample.qza

qiime demux summarize \
  --i-data qiime2_process/demux-subsample.qza \
  --o-visualization qiime2_process/demux-subsample.qzv