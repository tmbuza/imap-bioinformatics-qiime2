rule qiime2_dada2_denoise:
	input: 
		"qiime2_process/demux-subsample.qza", 
	output:
		repseq="qiime2_process/rep-seqs.qza",
		features="qiime2_process/feature-table.qza",
		stats="qiime2_process/stats.qza",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_dada2_denoise.sh"
