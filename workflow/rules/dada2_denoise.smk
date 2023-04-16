rule qiime2_dada2_denoise:
	input:
		"qiime2_process/demux.qza", 
	output:
		repseq="qiime2_process/rep-seqs.qza",
		features="qiime2_process/feature-table.qza",
		stats="qiime2_process/stats.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_dada2_denoise.sh"


rule qiime2_create_n_view_qc_qvz:
	input:
		metadata=rules.qiime2_validate_metadata.output,
		qcresults=rules.qiime2_dada2_denoise.output
	output:
		repseqviz="qiime2_process/rep-seqs.qzv",
		featuresviz="qiime2_process/feature-table.qzv",
		statsviz="qiime2_process/stats.qzv",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_create_qc_qvz_data.sh"