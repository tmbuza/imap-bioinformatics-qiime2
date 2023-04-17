rule qiime2_demux_qza_artifact:
	input:
		manifest="resources/metadata/qiime2_manifest_file.tsv",
	output:
		"qiime2_process/demux.qza"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_demux_qza_artifact.sh"


rule qiime2_demux_qzv_artifact:
	input:
		"qiime2_process/demux.qza"
	output:
		"qiime2_process/demux.qzv"
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/qiime2_demux_qza_artifact.sh"


rule demux_qzv_html_report:
	input:
 	   "qiime2_process/demux.qzv",
	output:
 	   "qiime2_process/interactive1/overview.html",
 	   "qiime2_process/interactive1/quality-plot.html",
	conda:
		"../envs/qiime220232.yml"
	shell:
		"bash workflow/scripts/demux_qzv_interactive_report.sh"
