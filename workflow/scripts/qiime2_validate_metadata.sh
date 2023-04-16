INPUTDIR="resources/metadata"
OUTDIR="qiime2_process"

mkdir -p "${OUTDIR}"

#----------
echo PROGRESS: Inspecting metadata
#----------

qiime tools inspect-metadata \
  "${INPUTDIR}"/qiime2_sample_metadata.tsv

## Tabulate metadata in QIIME2 format
qiime metadata tabulate \
  --m-input-file "${INPUTDIR}"/qiime2_sample_metadata.tsv \
  --o-visualization "${OUTDIR}"/sample-metadata.qzv


# ## Visualizing tabulated metadata
# qiime tools view "${OUTDIR}"/sample-metadata.qzv
