![Alt text for the image](https://github.com/amutheo/nf-core-hackathon-2025/blob/amutheo-patch-1/modules/mash/Mash..png)

# MASH (Minimizer-based Alignment Sketch)
A rapid tool applied in genome and metagenome distance estimation using MinHash algorithm. 

Mash utilizes a sketching algorithm to breakdown large genomic data into k-mers, compare genomic distances and classify closely related taxonomic groups

## Input 
```params.reads ``` &rarr; parameter defining the input path, with the required reads

```params.database``` &rarr; parameter defining the input path, with the required refseq database 

## Output
```mash_out.tab``` &rarr; mash report containing the 

```
#!/usr/bin/env nextflow
 

// Defining the needed params for the workflow

params.reads="/home/parcelli/nf_core_hack_2025/nf-core-hackathon-2025/test_data/non_human_reads/*.fastq"
params.database="/home/parcelli/nf_core_hack_2025/nf-core-hackathon-2025/refseq.genomes.k21s1000.msh"
 
input_ch=Channel.fromPath(params.reads)
input_db= Channel.value(params.database)
 
// Defining the process for the mash workflow
process Mash_taxonomy{
 
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'oras://community.wave.seqera.io/library/mash:2.3--c57e992e33e8b841' :
        'community.wave.seqera.io/library/mash:2.3--1b742dfaa6515b6e' }"
    
    publishDir 'results/mash', mode:'copy'
 
    input:
    tuple val(id), path(reads)
    val database
 
    output:
    path "${id}_screen.tab", emit: tab
    path "${id}_screen.tab", emit: txt
 
    
    script:
 
    //def prefix = ${reads}.baseName
    """
    mash screen -w -p 4 ${database} ${reads} > ${id}_screen.tab
    sort -gr ${id}_screen.tab > ${id}_mash_out.txt
 
    """
 
}
 
workflow{
        Mash_taxonomy(input_ch
                        .map{file ->
                        def id = file.baseName
                        return [id,file]
                        }, input_db)
}
 
```

  

  
  
