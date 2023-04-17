rule qiime2_community_plot:
	input:
  		"qiime2_process/rooted-tree.qza",
		"qiime2_process/feature-table.qza",
	output:
 		"qiime2_process/tree.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_community_plot.sh"
