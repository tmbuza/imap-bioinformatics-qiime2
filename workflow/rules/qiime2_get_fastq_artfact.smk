rule qiime2_demux_qza_artfact:
	input:
		manifest="resources/metadata/qiime2_manifest_file.tsv",
	output:
		"qiime2_process/demux.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_get_fastq_artfact.sh"


rule qiime2_demux_qzv_artfact:
	input:
		"qiime2_process/demux.qza"
	output:
		"qiime2_process/demux.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_get_fastq_artfact.sh"


rule qiime2_subsample_demux_qza_artfact:
  input:
    "qiime2_process/demux.qza"
  output:
    "qiime2_process/demux-subsample.qza",
  conda:
    "../envs/qiime220232.yml"
  shell:
    "bash workflow/scripts/qiime2_get_subsample.sh"


rule qiime2_subsample_demux_qzv_artfact:
	input:
 	   "qiime2_process/demux-subsample.qza"
	output:
 	   "qiime2_process/demux-subsample.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_get_subsample.sh"


rule demux_qzv_interactive_report:
	input:
 	   "qiime2_process/demux.qzv",
 	   "qiime2_process/demux-subsample.qzv",
	output:
 	   "qiime2_process/interactive1/overview.html",
 	   "qiime2_process/interactive1/quality-plot.html",
 	   "qiime2_process/interactive2/overview.html",
 	   "qiime2_process/interactive2/quality-plot.html",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/demux_qzv_interactive_report.sh"
