rule import_qiime2_metadata:
	output:
		manifest="resources/metadata/qiime2_manifest_file.tsv",
		metadata="resources/metadata/qiime2_metadata_file.tsv",
	conda:
		"../envs/bash.yml"
	shell:
		"bash workflow/scripts/import_qiime2_metadata.sh"


rule qiime2_validate_metadata:
	input:
		metadata=rules.import_qiime2_metadata.output.metadata
	output:
		"qiime2_process/sample-metadata.qzv"		
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_validate_metadata.sh"


