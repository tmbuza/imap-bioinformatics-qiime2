from snakemake.utils import min_version

min_version("6.10.0")

# Configuration file containing all user-specified settings
configfile: "config/config.yml"

report: "report/workflow.rst"


rule all:
	input:
        "sra_config_cache.png"

# Get dot rule graphs
rule plots:
	output:
		report("sra_config_cache.png", caption="report/sracache.rst", category="SRA cache"),
	shell:
         "cp ../imap-download-sra-reads/images/sra_config_cache.png {output}"

