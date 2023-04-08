from snakemake.utils import min_version

min_version("6.10.0")

configfile: "config/config.yml"# Alpha diversity


rule qiime2_rarefaction:
	input:
		script="workflow/scripts/qiime2_rarefaction.sh",
		table="qiime2_process/feature-table.qza",
		phylogeny="qiime2_process/rooted-tree.qza",
		metadata="resources/metadata/qiime2_metadata_file.tsv"
	output:
		"qiime2_process/alpha-rarefaction.qzv",
	conda:
		"../envs/qiime220232.yml"
	threads: 1
	shell:
		"bash {input.script} {output}"
