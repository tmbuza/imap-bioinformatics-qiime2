#!/usr/bin/env bash

set -ev

mkdir -p dags

snakemake -F --rulegraph | dot -Tsvg > dags/rulegraph.svg
snakemake -F --rulegraph | dot -Tpng > dags/rulegraph.png
