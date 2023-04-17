rule qiime2_taxonomic_assignment:
	input:
  		"resources/gg_classifier/gg-13-8-99-515-806-nb-classifier.qza",
		"qiime2_process/rep-seqs.qza",
	output:
  		"qiime2_process/taxonomy.qza",
  		"qiime2_process/taxonomy.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_assign_taxonomy.sh"
