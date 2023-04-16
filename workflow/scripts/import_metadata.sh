METADATA="../imap-read-quality-control/resources/metadata"
SAMPLESUNITS="../imap-read-quality-control/config"
OUTDIR="resources/metadata"
CONFIG="config"

echo PROGRESS: Importing processed metadata

mkdir -p "${OUTDIR}" "${CONFIG}"

cp "${METADATA}"/qiime2*.tsv "${OUTDIR}"
cp "${SAMPLESUNITS}"/pe_samples.tsv "${CONFIG}/samples.tsv"
cp "${SAMPLESUNITS}"/pe_units.tsv "${CONFIG}/units.tsv"