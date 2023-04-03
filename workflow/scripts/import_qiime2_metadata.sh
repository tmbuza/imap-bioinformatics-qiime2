INPUTDIR="../imap-read-quality-control/results"
OUTDIR="resources/metadata"

echo PROGRESS: Importing processed metadata

mkdir -p "${OUTDIR}"

cp "${INPUTDIR}"/qiime2*.tsv "${OUTDIR}"