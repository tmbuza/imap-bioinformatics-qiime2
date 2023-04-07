from snakemake.utils import min_version

min_version("6.10.0")

configfile: "config/config.yml"# Alpha diversity


rule qiime2_rarefaction:
	input:
		script="workflow/scripts/qiime2_rarefaction.sh",
		table="qiime2_process/feature-table.qza",
		phylogeny="qiime2_process/rooted-tree.qza",
		metadata="qiime2_process/sample-metadata.tsv"
	output:
		"qiime2_process/alpha-rarefaction.qzv",
	conda:
		"../envs/qiime220232.yml"
	threads: 1
	# shell:
	# 	"bash {input.script} {output}"
	shell:
		"""
		qiime diversity alpha-rarefaction \
		--i-table {input.table} \
		--i-phylogeny {input.phylogeny} \
		--p-max-depth 4000 \
		--p-metrics faith_pd \
		--p-metrics observed_features \
		--p-metrics shannon \
		--p-metrics pielou_e \
		--m-metadata-file {input.metadata} \
		--o-visualization {output}
		"""