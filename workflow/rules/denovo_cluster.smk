rule qiime2_denovo_cluster:
	input:
  		"qiime2_process/feature-table.qza",
		"qiime2_process/rep-seqs.qza",
	output:
 		"qiime2_process/feature-table-dn-99.qza",
		"qiime2_process/rep-seqs-dn-99.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_denovo_cluster.sh"