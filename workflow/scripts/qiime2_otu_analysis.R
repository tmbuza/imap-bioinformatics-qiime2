taxlevels <- c("kingdom", "phylum", "class", "order", "family", "genus")

taxa_abund <- feature_taxonomy %>%
  relocate(Taxon, .after = id) %>% 
  mutate_at(3:ncol(.), as.numeric) %>% 
  rename(feature = id,
         taxonomy = Taxon) %>% 
  relocate(taxonomy, .after = feature) %>% 
  distinct() %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(taxonomy = str_replace_all(taxonomy, "; s__$", ""),
         taxonomy = str_replace_all(taxonomy, "; g__$", ""),
         taxonomy = str_replace_all(taxonomy, "; f__$", ""),
         taxonomy = str_replace_all(taxonomy, "; o__$", ""),
         taxonomy = str_replace_all(taxonomy, "; c__$", ""),
         taxonomy = str_replace_all(taxonomy, "; p__$", ""),
         taxonomy = str_replace_all(taxonomy, "; k__$", ""),
         taxonomy = str_replace_all(taxonomy, "\\[|\\]", ""),
         taxonomy = str_replace_all(taxonomy, "\\s", "")) %>%
  dplyr::filter(!grepl("s__*", taxonomy)) %>%
  dplyr::filter(grepl("g__*", taxonomy)) %>% 
  select(-Confidence) %>% 
  mutate(taxonomy = str_replace_all(taxonomy, "\\w__", "")) %>% 
  separate(taxonomy, into = all_of(taxlevels), sep = ";")

colnames(taxa_abund)


otutable <- taxa_abund %>%
  select(-all_of(taxlevels))


taxonomy <- taxa_abund %>%
  rename_all(tolower) %>%
  select(feature, all_of(taxlevels)) %>%
  distinct()


metadata <- metadata %>% 
  select(sample_id = "sample-id", isolate) %>% 
  drop_na(isolate)

otu_counts <- otutable %>% 
  pivot_longer(-feature, names_to = "sample_id", values_to = "count") %>% 
  relocate(sample_id, .before = feature)

taxonomy <- taxonomy 
  
composite <- inner_join(metadata, otu_counts, by = "sample_id") %>% 
  inner_join( ., taxonomy, by = "feature") %>% 
  group_by(sample_id) %>% 
  mutate(rel_abund = count/sum(count)) %>% 
  ungroup() %>% 
  relocate(count, .before = rel_abund)