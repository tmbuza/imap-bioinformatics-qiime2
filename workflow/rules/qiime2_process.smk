from snakemake.utils import min_version

min_version("6.10.0")

# Configuration file containing all user-specified settings
configfile: "config/config.yml"

rule import_qiime2_mapping_files:
	output:
		manifest="resources/metadata/qiime2_manifest_file.tsv",
		metadata="resources/metadata/qiime2_metadata_file.tsv",
	conda:
		"../envs/bash.yml"
	shell:
		"bash workflow/scripts/import_qiime2_metadata.sh"


rule qiime2_validate_metadata:
	input:
		metadata=rules.import_qiime2_mapping_files.output.metadata
	output:
		"qiime2_process/sample-metadata.qzv"		
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_validate_metadata.sh"


rule qiime2_import_paired_fastq:
	input:
		manifest=rules.import_qiime2_mapping_files.output.manifest
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
