# Genus-level data
rule qiime2_collapse_genus:
	input:
  		"qiime2_process/feature-table.qza",
  		"qiime2_process/taxonomy.qza",
	output:
		"qiime2_process/feature-table-genus.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_collapse_genus.sh"