# Import metadata

rule import_metadata:
    output:
        "resources/metadata/qiime2_sample_metadata.tsv", 
        "config/samples.tsv",
        "config/units.tsv",
    shell:
        "bash workflow/scripts/import_metadata.sh"
        

rule import_manifest_file:
    output:
        "resources/metadata/qiime2_manifest_file.tsv",
    shell:
        "bash workflow/scripts/import_metadata.sh"
        