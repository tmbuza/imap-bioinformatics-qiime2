from snakemake.utils import min_version

min_version("6.10.0")

# Configuration file containing all user-specified settings
configfile: "config/config.yaml"

rule github_page_index:
    input:
        script="workflow/scripts/render.R",
        rmd="index.Rmd",
        rulegraph="dags/rulegraph.svg",
    output:
        doc="index.html",
    shell:
        """
        R -e "library(rmarkdown); render('{input.rmd}')"
        """

