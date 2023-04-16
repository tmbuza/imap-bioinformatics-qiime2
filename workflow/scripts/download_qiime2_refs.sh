OUTPUT="resources"

mkdir -p "${OUTPUT}"


## Taxonomy Rank file
wget \
  -O "${OUTPUT}"/reads/tax_slv_ssu_138.1.txt.gz \
  https://www.arb-silva.de/fileadmin/silva_databases/release_138.1/Exports/taxonomy/tax_slv_ssu_138.1.txt.gz
  
  gunzip tax_slv_ssu_138.1.txt.gz


## Taxonomy Map file
wget \
  -O "${OUTPUT}"/reads/taxmap_slv_ssu_ref_nr_138.1.txt.gz \
  https://www.arb-silva.de/fileadmin/silva_databases/release_138.1/Exports/taxonomy/taxmap_slv_ssu_ref_nr_138.1.txt.gz
  
  gunzip taxmap_slv_ssu_ref_nr_138.1.txt.gz


## Taxonomy Tree file
wget \
  -O "${OUTPUT}"/tax_slv_ssu_138.1.tre.gz \
  https://www.arb-silva.de/fileadmin/silva_databases/release_138.1/Exports/taxonomy/tax_slv_ssu_138.1.tre.gz
  
  gunzip tax_slv_ssu_138.1.tre.gz

  ## SILVA NR99 sequences (non-redundant and unaligned)
wget \
  -O "${OUTPUT}"/ \
  https://www.arb-silva.de/fileadmin/silva_databases/release_138.1/Exports/SILVA_138.1_SSURef_NR99_tax_silva_trunc.fasta.gz
  
  gunzip SILVA_138.1_SSURef_NR99_tax_silva_trunc.fasta.gz


## Import SILVA files into QIIME 2
## Taxonomy Rank file
qiime tools import \
    --type 'FeatureData[SILVATaxonomy]' \
    --input-path "${OUTPUT}"/tax_slv_ssu_138.1.txt \
    --output-path "${OUTPUT}"/taxranks-silva-138.1-ssu-nr99.qza \

## Taxonomy Mapping file
qiime tools import \
    --type 'FeatureData[SILVATaxidMap]' \
    --input-path "${OUTPUT}"/taxmap_slv_ssu_ref_nr_138.1.txt \
    --output-path "${OUTPUT}"/taxmap-silva-138.1-ssu-nr99.qza \

## Taxonomy Hierarchy Tree file:
qiime tools import \
    --type 'Phylogeny[Rooted]' \
    --input-path "${OUTPUT}"/tax_slv_ssu_138.1.tre \
    --output-path "${OUTPUT}"/taxtree-silva-138.1-nr99.qza \

## Fasta sequence file:
qiime tools import \
    --type 'FeatureData[RNASequence]' \
    --input-path "${OUTPUT}"/SILVA_138.1_SSURef_NR99_tax_silva_trunc.fasta \
    --output-path "${OUTPUT}"/silva-138.1-ssu-nr99-rna-seqs.qza

## Convert FeatureData[RNASequence] to FeatureData[DNASequence]
qiime rescript reverse-transcribe \
    --i-rna-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-rna-seqs.qza \
    --o-dna-sequences "${OUTPUT}"/silva-138.1-ssu-nr99-seqs.qza

## SILVA reference database
qiime rescript parse-silva-taxonomy \
    --i-taxonomy-tree "${OUTPUT}"/taxtree-silva-138.1-nr99.qza \
    --i-taxonomy-map "${OUTPUT}"/taxmap-silva-138.1-ssu-nr99.qza \
    --i-taxonomy-ranks "${OUTPUT}"/taxranks-silva-138.1-ssu-nr99.qza \
    --p-include-species-labels \
    --o-taxonomy "${OUTPUT}"/silva-138.1-ssu-nr99-tax.qza