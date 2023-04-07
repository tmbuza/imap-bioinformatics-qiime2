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

