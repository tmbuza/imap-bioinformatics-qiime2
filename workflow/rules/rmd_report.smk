
# Get dot rule graphs
rule get_dot_rulegraph:
	output:
		"dags/rulegraph.svg",
	conda:
		"../envs/rmarkdown.yml"	
	shell:
		"bash workflow/scripts/rules_dag.sh"


# Get project tree
rule project_tree:
	output:
		tree="results/project_tree.txt",
	conda:
		"../envs/rmarkdown.yml"
	shell:
		"""
		bash workflow/scripts/tree.sh
		"""

# Get smk html report
rule snakemake_html_report:
	output:
		smkhtml="report.html",
		smkpng="images/smkreport/screenshot.png",
	conda:
		"../envs/rmarkdown.yml"
	shell:
		"""
		bash workflow/scripts/smk_html_report.sh
		"""

# User styled report for GHPages
rule deploy_to_github_pages:
	input:
		dag="dags/rulegraph.svg",
		tree="results/project_tree.txt",
	output:
		doc="index.html",
	conda:
		"../envs/rmarkdown.yml"
	shell:
		"""
		R -e "library(rmarkdown); render('index.Rmd')"
		"""