#!/bin/bash

# Creating basic variables
INPUTDIR="../imap-read-quality-control/resources/reads/trimmed/decontam"
OUTDIR="resources/reads"

#----------------
echo PROGRESS: "Importing qced fastq reads"
#----------------

mkdir -p "${OUTDIR}"

cp "${INPUTDIR}"/*.gz "${OUTDIR}"/
