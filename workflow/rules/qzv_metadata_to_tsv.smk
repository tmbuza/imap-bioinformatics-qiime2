rule qzv_metadata_to_tsv:
	input:
		"qiime2_process/sample-metadata.qzv",	
	output:	
		"qiime2_process/sample-metadata.tsv",		
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qzv_metadata_to_tsv.sh"
