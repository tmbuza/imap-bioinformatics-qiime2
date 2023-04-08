from snakemake.utils import min_version

min_version("6.10.0")

# Configuration file containing all user-specified settings
configfile: "config/config.yml"

rule qiime2_import_paired_fastq:
	input:
		manifest=rules.import_qiime2_metadata.output.manifest
	output:
		"qiime2_process/demux.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_import_paired_fastq.sh"


rule qiime2_summarize_fastq:
	input:
		manifest=rules.qiime2_import_paired_fastq.output
	output:
		"qiime2_process/demux.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_import_paired_fastq.sh"
