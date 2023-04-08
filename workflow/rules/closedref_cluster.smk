rule qiime2_closedref_cluster:
	input:
		"qiime2_process/feature-table.qza",
		"qiime2_process/rep-seqs.qza",
		"resources/gg_classifier/85_otus.qza",
	output:
		"qiime2_process/table-cr-85.qza",
		"qiime2_process/rep-seqs-cr-85.qza",
		"qiime2_process/unmatched-cr-85.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_closedref_cluster.sh"