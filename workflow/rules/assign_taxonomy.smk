rule qiime2_taxonomic_assignment:
	input:
  		"resources/silva-138.1-ssu-nr99-rna-seqs.qza",
		"qiime2_process/rep-seqs-dn-99.qza",
	output:
  		"qiime2_process/taxonomy.qza",
  		"qiime2_process/taxonomy.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_taxonomic_assign.sh"
