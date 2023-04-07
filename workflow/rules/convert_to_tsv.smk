rule qiime2_feature_n_taxonomy_tsv:
	input:
  		"qiime2_process/feature-table.qza",
  		"qiime2_process/taxonomy.qza",
	output:
		featable="qiime2_process/transformed/feature-table.tsv",
		taxonomy="qiime2_process/transformed/taxonomy.tsv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_data_transformation.sh"
