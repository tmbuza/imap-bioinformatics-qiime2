OUTDIR="qiime2_process"
TEMPDIR="${OUTDIR}"/tmp
INTERACTIVE1="${OUTDIR}"/interactive1
INTERACTIVE2="${OUTDIR}"/interactive2

mkdir -p "${OUTDIR}" "${TEMPDIR}" "${INTERACTIVE1}" "${INTERACTIVE2}"

#----------
echo PROGRESS: Converting demux.qzv to demux.zip then unzip to a directory
#----------

cp "${OUTDIR}"/demux.qzv "${OUTDIR}"/demux.zip
unzip -o "${OUTDIR}"/demux.zip -d "${TEMPDIR}"

cp -r "${TEMPDIR}"/*/data/* "${INTERACTIVE1}"/

# Clean the directory
rm -rf "${TEMPDIR}" 

