#! /bin/bash


OUTDIR=data/qiime/references



####################################
# Preparing QIIME2 Reference Files #
####################################

echo PROGRESS: Preparing qiime2 reference files. 

# Making reference output directory
mkdir -p "${OUTDIR}"



echo PROGRESS: Downloading a qiime2 trained classifer 

wget \
  -O  "${OUTDIR}"/"gg-13-8-99-515-806-nb-classifier.qza" \
  "https://data.qiime2.org/2023.2/common/gg-13-8-99-515-806-nb-classifier.qza"

