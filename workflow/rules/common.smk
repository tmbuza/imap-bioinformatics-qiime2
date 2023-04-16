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