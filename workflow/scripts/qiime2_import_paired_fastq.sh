qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $PWD/resources/metadata/qiime2_manifest_file.tsv \
  --output-path $PWD/qiime2_process/demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

qiime demux summarize \
  --i-data $PWD/qiime2_process/demux.qza \
  --o-visualization $PWD/qiime2_process/demux.qzv

# ## Visualizing output
# qiime tools view $PWD/qiime2_process/demux.qzv
