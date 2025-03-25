![Alt text for the image](https://github.com/amutheo/nf-core-hackathon-2025/blob/amutheo-patch-1/modules/mash/Mash..png)

# MASH (Minimizer-based Alignment Sketch)
A rapid tool applied in genome and metagenome distance estimation using MinHash algorithm. 

Mash utilizes a sketching algorithm to breakdown large genomic data into k-mers, compare genomic distances and classify closely related taxonomic groups

## Input 
```params.reads ``` &rarr; parameter defining the input path, with the required reads

```params.database``` &rarr; parameter defining the input path, with the required refseq database 

## Output
```mash.results.txt``` &rarr; mash report containing taxonomic information e.g. [identity, shared-hashes, query-comment] 


  

  
  
