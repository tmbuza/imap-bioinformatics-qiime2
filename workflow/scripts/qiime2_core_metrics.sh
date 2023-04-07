OUTDIR=qiime2_process

rarefiedtable=${OUTDIR}/alpha_diversity/rarefied_table.qza
faithpdvector=${OUTDIR}/alpha_diversity/faith_pd_vector.qza
observedfeatures=${OUTDIR}/alpha_diversity/observed_features_vector.qza
shannonvector=${OUTDIR}/alpha_diversity/shannon_vector.qza
evennessvector=${OUTDIR}/alpha_diversity/evenness_vector.qza
unwunifrac=${OUTDIR}/beta_diversity/unweighted_unifrac.qza
wunifrac=${OUTDIR}/beta_diversity/weighted_unifrac.qza
jaccard=${OUTDIR}/beta_diversity/jaccard.qza
braycurtis=${OUTDIR}/beta_diversity/bray_curtis.qza
unwunifracpcoa=${OUTDIR}/beta_diversity/unweighted_unifrac_pcoa.qza
wunifracpcoa=${OUTDIR}/beta_diversity/weighted_unifrac_pcoa.qza
jaccardpcoa=${OUTDIR}/beta_diversity/jaccard_pcoa.qza
braypcoa=${OUTDIR}/beta_diversity/bray_curtis_pcoa.qza
unwunifracemperor=${OUTDIR}/beta_diversity/unweighted_unifrac_emperor.qzv
wunifracemperor=${OUTDIR}/beta_diversity/weighted_unifrac_emperor.qzv
jaccardemperor=${OUTDIR}/beta_diversity/jaccard_emperor.qzv
braycurtisemperor=${OUTDIR}/beta_diversity/bray_curtis_emperor.qzv

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny ${OUTDIR}/rooted-tree.qza \
  --i-table ${OUTDIR}/feature-table.qza \
  --p-sampling-depth 1000 \
  --m-metadata-file ${OUTDIR}/sample-metadata.tsv \
  --o-rarefied-table ${rarefiedtable} \
  --o-faith-pd-vector ${faithpdvector} \
  --o-observed-features-vector ${observedfeatures} \
  --o-shannon-vector ${shannonvector} \
  --o-evenness-vector ${evennessvector} \
  --o-unweighted-unifrac-distance-matrix ${unwunifrac} \
  --o-weighted-unifrac-distance-matrix ${wunifrac} \
  --o-jaccard-distance-matrix ${jaccard} \
  --o-bray-curtis-distance-matrix ${braycurtis} \
  --o-unweighted-unifrac-pcoa-results ${unwunifracpcoa} \
  --o-weighted-unifrac-pcoa-results ${wunifracpcoa} \
  --o-jaccard-pcoa-results ${jaccardpcoa} \
  --o-bray-curtis-pcoa-results ${braypcoa} \
  --o-unweighted-unifrac-emperor ${unwunifracemperor} \
  --o-weighted-unifrac-emperor ${wunifracemperor} \
  --o-jaccard-emperor ${jaccardemperor} \
  --o-bray-curtis-emperor ${braycurtisemperor} \
  --p-n-jobs-or-threads 1
