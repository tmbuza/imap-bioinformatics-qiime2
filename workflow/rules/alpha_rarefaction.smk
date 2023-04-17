from snakemake.utils import min_version

min_version("6.10.0")

configfile: "config/config.yml"# Alpha diversity


rule qiime2_rarefaction:
	input:
		table="qiime2_process/feature-table.qza",
		phylogeny="qiime2_process/rooted-tree.qza",
		metadata="qiime2_process/sample-metadata.tsv",
	output:
		"qiime2_process/alpha-rarefaction.qzv",
	conda:
		"../envs/qiime220232.yml"
	threads: 1
	shell:
		"bash workflow/scripts/qiime2_rarefaction.sh"


rule rarefy_interactive_report:
	input:
		"qiime2_process/alpha-rarefaction.qzv",
	output:
		"qiime2_process/rarefy_interactive/index.html",
	conda:
		"../envs/qiime220232.yml"
	threads: 1
	shell:
		"bash workflow/scripts/rarefy_interactive_report.sh"

