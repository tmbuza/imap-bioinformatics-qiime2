# Paired-End
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path resources/metadata/qiime2_manifest_file.tsv \
  --output-path qiime2_process/demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

qiime demux summarize \
  --i-data qiime2_process/demux.qza \
  --o-visualization qiime2_process/demux.qzv

# # Single-End
# qiime tools import \
#   --type 'SampleData[SequencesWithQuality]'\
#   --input-path resources/metadata/se_qiime2_manifest_file.tsv \
#   --output-path qiime2_process/se-demux.qza \
#   --input-format SingleEndFastqManifestPhred33V2

# qiime demux summarize \
#   --i-data qiime2_process/se-demux.qza \
#   --o-visualization qiime2_process/se-demux.qzv
