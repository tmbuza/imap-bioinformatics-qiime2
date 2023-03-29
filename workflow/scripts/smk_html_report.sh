#!/bin/bash

# Generate interactive html report
snakemake --unlock;
snakemake --report report.html;
hti -H report.html -o images/smkreport;

