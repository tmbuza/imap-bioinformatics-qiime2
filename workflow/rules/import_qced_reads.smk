# Import reads
import os
import csv
import pandas as pd

METADATA = (
    pd.read_csv(config["samples"], sep="\t", dtype={"sample_name": str})
    .set_index("sample_name", drop=False)
    .sort_index()
)

SAMPLES = METADATA["sample_name"]

OUTDIR="resources/reads" 


if not os.path.exists(OUTDIR):
   os.makedirs(OUTDIR)

   
rule import_qced_reads:
    output:
        gzfq=expand("{outdir}/{sample}_{sraNum}.fastq.gz", outdir=OUTDIR, sample=SAMPLES, sraNum=config["sraNum"]),
    shell:
        "bash workflow/scripts/import_qced_reads.sh"