# filter the samples
qiime feature-table filter-samples \
  --i-table qiime2_process/feature-table.qza \
  --m-metadata-file resources/metadata/qiime2_metadata_file.tsv \
  --p-where "[time]='Early'" \
  --o-filtered-table results/early-table.qza

# qiime aldex2 aldex2 \
#   --i-table data/gut-table.qza \
#   --m-metadata-file resources/sample-metadata.tsv \
#   --m-metadata-column Subject \
#   --output-dir data/gut-test

# qiime aldex2 effect-plot \
#     --i-table gut-test/differentials.qza \
#     --o-visualization gut-test/gut_test

# qiime aldex2 extract-differences \
#     --i-table gut-test/differentials.qza \
#     --o-differentials gut-test/sig_gut \
#     --p-sig-threshold 0.1 \
#     --p-effect-threshold 0 \
#     --p-difference-threshold 0

# qiime tools export \
#     --input-path gut-test/sig_gut.qza \
#     --output-path differentially-expressed-features