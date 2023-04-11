rule qiime2_filter_samples:
	input:
  		"qiime2_process/feature-table.qza",
  		"resources/metadata/qiime2_metadata_file.tsv",
	output:
        "results/early-table.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_filter_samples.sh"
 