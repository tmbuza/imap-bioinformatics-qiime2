# Creating tab-separated feature table
qiime tools export \
  --input-path $PWD/qiime2_process/feature-table.qza \
  --output-path $PWD/qiime2_process/transformed

# Converting biom to tsv feature table
biom convert \
  -i $PWD/qiime2_process/transformed/feature-table.biom \
  -o $PWD/qiime2_process/transformed/feature-table.tsv --to-tsv

# Creating tab-separated taxonomy table
qiime tools export \
  --input-path $PWD/qiime2_process/taxonomy.qza \
  --output-path $PWD/qiime2_process/transformed

# Tabulating fetature table with taxonomy”
qiime metadata tabulate \
  --m-input-file $PWD/qiime2_process/transformed/feature-table.tsv \
  --m-input-file $PWD/qiime2_process/transformed/taxonomy.tsv \
  --o-visualization $PWD/qiime2_process/transformed/feature-taxonomy-table.qzv
  
# Exporting unrooted and rooted Newick tree
qiime tools export \
  --input-path $PWD/qiime2_process/unrooted-tree.qza \
  --output-path $PWD/qiime2_process/unrooted-tree \

qiime tools export \
  --input-path $PWD/qiime2_process/rooted-tree.qza \
  --output-path $PWD/qiime2_process/rooted-tree \
