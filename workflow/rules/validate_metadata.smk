rule qiime2_validate_metadata:
	input:
		metadata="resources/metadata/qiime2_sample_metadata.tsv",
	output:
		"qiime2_process/sample-metadata.qzv",			
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_validate_metadata.sh"


