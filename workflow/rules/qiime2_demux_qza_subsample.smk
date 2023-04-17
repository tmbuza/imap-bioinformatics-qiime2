rule qiime2_demux_qza_subsample:
  input:
    "qiime2_process/demux.qza"
  output:
    "qiime2_process/demux-subsample.qza",
  conda:
    "../envs/qiime220232.yml"
  shell:
    "bash workflow/scripts/qiime2_demux_qza_subsample.sh"


rule qiime2_demux_qzv_subsample:
	input:
 	   "qiime2_process/demux-subsample.qza"
	output:
 	   "qiime2_process/demux-subsample.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_demux_qza_subsample.sh"


rule demux_qzv_sub_html_report:
	input:
 	   "qiime2_process/demux-subsample.qzv",
	output:
 	   "qiime2_process/interactive2/overview.html",
 	   "qiime2_process/interactive2/quality-plot.html",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/demux_qzv_sub_interactive_report.sh"
