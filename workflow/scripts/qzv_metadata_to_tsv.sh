#----------
echo PROGRESS: Converting sample-metadata.qzv to sample-metadata.tsv
#----------

cp qiime2_process/sample-metadata.qzv qiime2_process/sample-metadata.zip

unzip -oj qiime2_process/sample-metadata.zip '*/data/metadata.tsv' -d qiime2_process 
  
mv qiime2_process/metadata.tsv qiime2_process/sample-metadata.tsv
  
rm qiime2_process/sample-metadata.zip
