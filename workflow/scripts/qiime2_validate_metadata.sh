qiime tools inspect-metadata \
  $PWD/data/metadata/qiime2_manifest_file.tsv

## Tabulate metadata in QIIME2 format
qiime metadata tabulate \
  --m-input-file $PWD/data/metadata/qiime2_manifest_file.tsv \
  --o-visualization $PWD/qiime2_process/q2-sample-metadata.qzv

# ## Visualizing tabulated metadata
# qiime tools view $PWD/qiime2_process/q2-sample-metadata.qzv
