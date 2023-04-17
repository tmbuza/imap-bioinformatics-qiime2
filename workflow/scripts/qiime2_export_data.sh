INPUTDIR="qiime2_process"
EXPORTDIR="qiime2_process/export"

mkdir -p "${EXPORTDIR}"

# Creating tab-separated feature table
qiime tools export \
  --input-path "${INPUTDIR}"/feature-table.qza \
  --output-path "${EXPORTDIR}"

# Converting biom to tsv feature table
biom convert \
  -i "${EXPORTDIR}"/feature-table.biom \
  -o "${EXPORTDIR}"/feature-table.tsv --to-tsv

# Creating tab-separated taxonomy table
qiime tools export \
  --input-path "${INPUTDIR}"/taxonomy.qza \
  --output-path "${EXPORTDIR}"

# Tabulating fetature table with taxonomy”
qiime metadata tabulate \
  --m-input-file "${EXPORTDIR}"/feature-table.tsv \
  --m-input-file "${EXPORTDIR}"/taxonomy.tsv \
  --o-visualization "${INPUTDIR}"/feature-taxonomy-table.qzv
  
# Exporting unrooted and rooted Newick tree
qiime tools export \
  --input-path "${INPUTDIR}"/unrooted-tree.qza \
  --output-path "${EXPORTDIR}"/unrooted-tree \

qiime tools export \
  --input-path "${INPUTDIR}"/rooted-tree.qza \
  --output-path "${EXPORTDIR}"/rooted-tree \

# Exporting representative sequences to a fasta file
qiime tools export \
  --input-path "${INPUTDIR}"/rep-seqs.qza \
  --output-path "${EXPORTDIR}"/qiime2-rep-seqs