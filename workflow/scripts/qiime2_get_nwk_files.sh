# Exporting unrooted and rooted Newick tree
qiime tools export \
  --input-path $PWD/qiime2_process/unrooted-tree.qza \
  --output-path $PWD/qiime2_process/unrooted-tree \

qiime tools export \
  --input-path $PWD/qiime2_process/rooted-tree.qza \
  --output-path $PWD/qiime2_process/rooted-tree \
