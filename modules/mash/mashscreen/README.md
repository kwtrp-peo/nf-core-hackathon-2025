![Alt text for the image](https://github.com/amutheo/nf-core-hackathon-2025/blob/dev/modules/mash/mashscreen/Mash..png)

# MASH (Minimizer-based Alignment Sketch)
## Overview 
A rapid tool applied in genome and metagenome distance estimation using MinHash algorithm. 

Mash utilizes a sketching algorithm to breakdown large genomic data into k-mers, compare genomic distances and classify closely related taxonomic groups

## Usage

## Input 
```fastq_files ``` &rarr; file(s) with the  reads to be taxonomically classified

```mash.db``` &rarr; the required database to screen the reads against

## Output
```mash.results.tab``` &rarr; mash report containing taxonomic information e.g. [identity, shared-hashes, query-comment] 

## Usage Example 

```
mash screen -w -p ${params.threads} ${params.sketch} ${fastq_file} > screen_${sample_id}.tab
```

  ### Breaking it down:
  
  . ```mash screen``` 
  
  This tells the system to use mash to screen the fastq reads against the provided database

  . ```-w, -p```
  
  -w helps optimize the workflow by reducing redundancy and -p specifies the number of threads used
  
  . ```params.threads```
  
  Specify the number of threads required
  
  . ```params.sketch```
  
  This defines the database to screen against
  
  . ```fastq_file```
  
  The reads to be screened againsta a database
  
  . ```screen_${sample_id}.tab```
  
  The output file with the taxonomic classification 
