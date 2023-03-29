qiime tools export \
    --input-path $PWD/qiime2_process/feature-table.qza \
    --output-path $PWD/qiime2_process

biom convert \
    -i $PWD/qiime2_process/feature-table.biom \
    -o $PWD/qiime2_process/feature-table.tsv --to-tsv

qiime tools export \
    --input-path $PWD/qiime2_process/taxonomy.qza \
    --output-path $PWD/qiime2_process

qiime metadata tabulate \
    --m-input-file $PWD/qiime2_process/feature-table.tsv \
    --m-input-file $PWD/qiime2_process/taxonomy.tsv \
    --o-visualization $PWD/qiime2_process/feature-taxonomy-table.qzv
  
# qiime tools view $PWD/qiime2_process/feature-taxonomy-table.qzv

### Unrooted Newick tree
qiime tools export \
    --input-path $PWD/qiime2_process/unrooted-tree.qza \
    --output-path $PWD/qiime2_process

### rooted Newick tree
qiime tools export \
    --input-path $PWD/qiime2_process/rooted-tree.qza \
    --output-path $PWD/qiime2_process

