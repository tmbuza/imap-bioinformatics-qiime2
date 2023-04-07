OUTPUT="resources"

mkdir -p "${OUTPUT}"

# echo PROGRESS: Preparing SILVA reference database as described [here](https://forum.qiime2.org/t/processing-filtering-and-evaluating-the-silva-database-and-other-reference-sequence-data-with-rescript/15494)

# echo PROGRESS: Importing and convert SILVA data using rescript

# qiime rescript get-silva-data \
#     --p-version '138.1' \
#     --p-target 'SSURef_NR99' \
#     --p-include-species-labels \
#     --o-silva-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-rna-seqs.qza \
#     --o-silva-taxonomy "${OUTPUT}"/silva-138.1-ssu-nr99-tax.qza

# echo PROGRESS: Converting FeatureData[RNASequence] to FeatureData[DNASequence]

# qiime rescript reverse-transcribe \
#     --i-rna-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-rna-seqs.qza \
#     --o-dna-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs.qza

# echo PROGRESS: QC on Refs DB

# qiime rescript cull-seqs \
#     --i-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs.qza \
#     --o-clean-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-cleaned.qza

# echo PROGRESS: Filtering sequences by length and taxonomy

# qiime rescript filter-seqs-length-by-taxon \
#     --i-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-cleaned.qza \
#     --i-taxonomy "${OUTPUT}"/silva-138.1-ssu-nr99-tax.qza \
#     --p-labels Archaea Bacteria Eukaryota \
#     --p-min-lens 900 1200 1400 \
#     --o-filtered-seqs "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-filt.qza \
#     --o-discarded-seqs "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-discard.qza

# echo PROGRESS: Dereplication of sequences and taxonomy

# qiime rescript dereplicate \
#     --i-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-filt.qza  \
#     --i-taxa "${OUTPUT}"/silva-138.1-ssu-nr99-tax.qza \
#     --p-mode 'uniq' \
#     --o-dereplicated-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-derep-uniq.qza \
#     --o-dereplicated-taxa "${OUTPUT}"/silva-138.1-ssu-nr99-tax-derep-uniq.qza

# echo PROGRESS: Making SILVA full-length SSU classifier

# qiime feature-classifier fit-classifier-naive-bayes \
#   --i-reference-reads  "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-derep-uniq.qza \
#   --i-reference-taxonomy "${OUTPUT}"/silva-138.1-ssu-nr99-tax-derep-uniq.qza \
#   --o-classifier "${OUTPUT}"/silva-138.1-ssu-nr99-classifier.qza

# echo PROGRESS: Making amplicon-region specific classifier

# echo Must use the same primer sequences used in PCR or sequencing when extracting the amplicon region from the reference database.

# qiime feature-classifier extract-reads \
#     --i-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-derep-uniq.qza \
#     --p-f-primer GTGYCAGCMGCCGCGGTAA \
#     --p-r-primer GGACTACNVGGGTWTCTAAT \
#     --p-n-jobs 2 \
#     --p-read-orientation 'forward' \
#     --o-reads "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-515f-806r.qza

# echo PROGRESS: Dereplication extracted region

# qiime rescript dereplicate \
#     --i-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-515f-806r.qza \
#     --i-taxa "${OUTPUT}"/silva-138.1-ssu-nr99-tax-derep-uniq.qza \
#     --p-mode 'uniq' \
#     --o-dereplicated-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-515f-806r-uniq.qza \
#     --o-dereplicated-taxa  "${OUTPUT}"/silva-138.1-ssu-nr99-tax-515f-806r-derep-uniq.qza

echo PROGRESS: Building amplicon-region specific classifier

qiime feature-classifier fit-classifier-naive-bayes \
    --i-reference-reads "${OUTPUT}"/silva-138.1-ssu-nr99-seqs-515f-806r-uniq.qza \
    --i-reference-taxonomy "${OUTPUT}"/silva-138.1-ssu-nr99-tax-515f-806r-derep-uniq.qza \
    --o-classifier "${OUTPUT}"/silva-138.1-ssu-nr99-515f-806r-classifier.qza