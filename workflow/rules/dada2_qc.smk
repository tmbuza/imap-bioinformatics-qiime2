rule qiime2_dada2_read_qc:
	input:
		manifest=rules.qiime2_import_paired_fastq.output
	output:
		repseq="qiime2_process/rep-seqs.qza",
		features="qiime2_process/feature-table.qza",
		stats="qiime2_process/stats.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_dada2_read_qc.sh"


rule qiime2_create_n_view_qc_qvz:
	input:
		metadata=rules.qiime2_validate_metadata.output,
		qcresults=rules.qiime2_dada2_read_qc.output
	output:
		repseqviz="qiime2_process/rep-seqs.qzv",
		featuresviz="qiime2_process/feature-table.qzv",
		statsviz="qiime2_process/stats.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_create_qc_qvz_data.sh"