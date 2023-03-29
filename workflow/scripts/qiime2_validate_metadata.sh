INPUTDIR="resources/metadata"
OUTDIR="qiime2_process"

mkdir -p "${OUTDIR}"

qiime tools inspect-metadata \
  $PWD/"${INPUTDIR}"/qiime2_metadata_file.tsv

## Tabulate metadata in QIIME2 format
qiime metadata tabulate \
  --m-input-file $PWD/"${INPUTDIR}"/qiime2_manifest_file.tsv \
  --o-visualization $PWD/"${OUTDIR}"/sample-metadata.qzv

# ## Visualizing tabulated metadata
# qiime tools view $PWD/"${OUTDIR}"/sample-metadata.qzv
