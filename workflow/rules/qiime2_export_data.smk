rule qiime2_export_data:
	input:
		"qiime2_process/feature-table.qza",
		"qiime2_process/taxonomy.qza",
	output:
		"qiime2_process/export/feature-table.tsv",
		"qiime2_process/export/taxonomy.tsv",
		"qiime2_process/export/qiime2-rep-seqs/dna-sequences.fasta",
		"qiime2_process/export/rooted-tree/tree.nwk",
		"qiime2_process/export/unrooted-tree/tree.nwk",
		"qiime2_process/export/feature-table.biom",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_export_data.sh"
