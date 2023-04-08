rule qiime2_openref_cluster:
	input:
		"qiime2_process/feature-table.qza",
		"qiime2_process/rep-seqs.qza",
		"resources/gg_classifier/85_otus.qza",
	output:
		"qiime2_process/table-or-85.qza",
		"qiime2_process/rep-seqs-or-85.qza",
		"qiime2_process/new-ref-seqs-or-85.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_openref_cluster.sh"