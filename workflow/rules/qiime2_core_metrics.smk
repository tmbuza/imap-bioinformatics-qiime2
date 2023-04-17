rule alpha_diversity_metrics:
    input:
        table="qiime2_process/feature-table.qza",
        phylogeny="qiime2_process/rooted-tree.qza",
        metadata="qiime2_process/sample-metadata.tsv"
    params: 
        config["core_sampling_depth"]
    output:
        rarefiedtable="qiime2_process/alpha_diversity/rarefied_table.qza",
        faithpdvector="qiime2_process/alpha_diversity/faith_pd_vector.qza",
        observedfeatures="qiime2_process/alpha_diversity/observed_features_vector.qza",
        shannonvector="qiime2_process/alpha_diversity/shannon_vector.qza",
        evennessvector="qiime2_process/alpha_diversity/evenness_vector.qza",
        unwunifrac="qiime2_process/beta_diversity/unweighted_unifrac.qza",
        wunifrac="qiime2_process/beta_diversity/weighted_unifrac.qza",
        jaccard="qiime2_process/beta_diversity/jaccard.qza",
        braycurtis="qiime2_process/beta_diversity/bray_curtis.qza",
        unwunifracpcoa="qiime2_process/beta_diversity/unweighted_unifrac_pcoa.qza",
        wunifracpcoa="qiime2_process/beta_diversity/weighted_unifrac_pcoa.qza",
        jaccardpcoa="qiime2_process/beta_diversity/jaccard_pcoa.qza",
        braypcoa="qiime2_process/beta_diversity/bray_curtis_pcoa.qza",
        unwunifracemperor="qiime2_process/beta_diversity/unweighted_unifrac_emperor.qzv",
        wunifracemperor="qiime2_process/beta_diversity/weighted_unifrac_emperor.qzv",
        jaccardemperor="qiime2_process/beta_diversity/jaccard_emperor.qzv",
        braycurtisemperor="qiime2_process/beta_diversity/bray_curtis_emperor.qzv"
    threads: config["threads"]
    shell:
        "bash workflow/scripts/qiime2_core_metrics.sh"