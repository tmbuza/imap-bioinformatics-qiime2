OUTDIR="qiime2_process"
TEMPDIR="${OUTDIR}"/tmp
TREE="${OUTDIR}"/tree_interactive

mkdir -p "${OUTDIR}" "${TEMPDIR}" "${TREE}"

#----------
echo PROGRESS: Converting tree.qzv to tree.zip then unzip to a directory
#----------

cp "${OUTDIR}"/tree.qzv "${OUTDIR}"/tree.zip
unzip -o "${OUTDIR}"/tree.zip -d "${TEMPDIR}"

cp -r "${TEMPDIR}"/*/data/* "${TREE}"/

# Clean the directory
rm -rf "${TEMPDIR}" 

