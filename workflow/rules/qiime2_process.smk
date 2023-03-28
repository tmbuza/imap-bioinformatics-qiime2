rule import_qiime2_mapping_files:
	output:
		manifest="resources/metadata/qiime2_manifest_file.tsv",
		metadata="resources/metadata/qiime2_metadata_file.tsv",
	shell:
		"bash workflow/scripts/import_qiime2_metadata.sh"


rule qiime2_validate_metadata:
	input:
		manifest=rules.import_qiime2_mapping_files.output.manifest
	output:
		"qiime2_process/sample-metadata.t"		
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_validate_metadata.sh"


rule qiime2_import_paired_fastq:
	input:
		manifest=rules.import_qiime2_mapping_files.output.manifest
	output:
		"qiime2_process/demux.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_import_paired_fastq.sh"


rule qiime2_summarize_fastq:
	input:
		manifest=rules.qiime2_import_paired_fastq.output
	output:
		"qiime2_process/demux.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_import_paired_fastq.sh"


rule qiime2_read_qc:
	input:
		manifest=rules.qiime2_import_paired_fastq.output
	output:
		repseq="qiime2_process/rep-seqs.qza",
		features="qiime2_process/feature-table.qza",
		stats="qiime2_process/stats.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_read_qc.sh"


rule qiime2_create_n_view_qc_qvz:
	input:
		metadata=rules.qiime2_validate_metadata.output,
		qcresults=rules.qiime2_read_qc.output
	output:
		repseqviz="qiime2_process/rep-seqs.qzv",
		featuresviz="qiime2_process/feature-table.qzv",
		statsviz="qiime2_process/stats.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_create_qc_qvz_data.sh"


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


rule qiime2_closedref_cluster:
	input:
		"qiime2_process/feature-table.qza",
		"qiime2_process/rep-seqs.qza",
		"resources/85_otus.qza",
	output:
		"qiime2_process/table-cr-85.qza",
		"qiime2_process/rep-seqs-cr-85.qza",
		"qiime2_process/unmatched-cr-85.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_closedref_cluster.sh"


rule qiime2_openref_cluster:
	input:
		"qiime2_process/feature-table.qza",
		"qiime2_process/rep-seqs.qza",
		"resources/85_otus.qza",
	output:
		"qiime2_process/table-or-85.qza",
		"qiime2_process/rep-seqs-or-85.qza",
		"qiime2_process/new-ref-seqs-or-85.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_openref_cluster.sh"


rule qiime2_mafft_alignment:
	input:
		"qiime2_process/rep-seqs.qza",
	output:
  		"qiime2_process/aligned-rep-seqs.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_mafft_alignment.sh"


rule qiime2_mask_alignment:
	input:
		"qiime2_process/aligned-rep-seqs.qza",
	output:
  		"qiime2_process/masked-aligned-rep-seqs.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_mafft_alignment.sh"


rule qiime2_masked_aligned_viz:
	input:
		"qiime2_process/masked-aligned-rep-seqs.qza",
	output:
  		"qiime2_process/masked-aligned-rep-seqs.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_mafft_alignment.sh"


rule qiime2_phylogeny_unrooted_tree:
	input:
		"qiime2_process/masked-aligned-rep-seqs.qza",
	output:
  		"qiime2_process/unrooted-tree.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_phylogeny_cluster.sh"


rule qiime2_phylogeny_rooted_tree:
	input:
  		"qiime2_process/unrooted-tree.qza",
	output:
  		"qiime2_process/rooted-tree.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_phylogeny_cluster.sh"


rule qiime2_taxonomic_assignment:
	input:
  		"resources/gg-13-8-99-515-806-nb-classifier.qza",
		"qiime2_process/rep-seqs-dn-99.qza",
	output:
  		"qiime2_process/taxonomy.qza",
  		"qiime2_process/taxonomy.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_taxonomic_assign.sh"


rule qiime2_taxa_interactive_barplots:
	input:
  		"qiime2_process/feature-table.qza",
		"qiime2_process/taxonomy.qza",
		"resources/metadata/qiime2_metadata_file.tsv"
	output:
		"qiime2_process/taxa-bar-plots.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_taxa_barplots.sh"
