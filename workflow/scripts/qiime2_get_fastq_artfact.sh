qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path resources/metadata/qiime2_manifest_file.tsv \
  --output-path qiime2_process/demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

qiime demux summarize \
  --i-data qiime2_process/demux.qza \
  --o-visualization qiime2_process/demux.qzv

## Visualizing output
# qiime tools view qiime2_process/demux.qzv

qiime demux subsample-paired \
  --i-sequences qiime2_process/demux.qza \
  --p-fraction 0.15 \
  --o-subsampled-sequences qiime2_process/demux-subsample.qza

qiime demux summarize \
  --i-data qiime2_process/demux-subsample.qza \
  --o-visualization qiime2_process/demux-subsample.qzv