OUTDIR="qiime2_process"
TEMPDIR="${OUTDIR}"/tmp
RAREFY="${OUTDIR}"/rarefy_interactive

mkdir -p "${OUTDIR}" "${TEMPDIR}" "${RAREFY}"

#----------
echo PROGRESS: Converting alpha-rarefaction.qzv to alpha-rarefaction.zip then unzip to a directory
#----------

cp "${OUTDIR}"/alpha-rarefaction.qzv "${OUTDIR}"/alpha-rarefaction.zip
unzip -o "${OUTDIR}"/alpha-rarefaction.zip -d "${TEMPDIR}"

cp -r "${TEMPDIR}"/*/data/* "${RAREFY}"/

# Clean the directory
rm -rf "${TEMPDIR}" 