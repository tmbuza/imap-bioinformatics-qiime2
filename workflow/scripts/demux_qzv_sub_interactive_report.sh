OUTDIR="qiime2_process"
TEMPDIR="${OUTDIR}"/tmp
INTERACTIVE1="${OUTDIR}"/interactive1
INTERACTIVE2="${OUTDIR}"/interactive2

mkdir -p "${OUTDIR}" "${TEMPDIR}" "${INTERACTIVE1}" "${INTERACTIVE2}"

#----------
echo PROGRESS: Converting demux-subsample.qzv to demux-subsample.zip then unzip to a directory
#----------

cp "${OUTDIR}"/demux-subsample.qzv "${OUTDIR}"/demux-subsample.zip
unzip -o "${OUTDIR}"/demux-subsample.zip -d "${TEMPDIR}"

cp -r "${TEMPDIR}"/*/data/* "${INTERACTIVE2}"/

# Clean the directory
rm -rf "${TEMPDIR}" 