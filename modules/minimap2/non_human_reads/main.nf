#!/usr/bin/env nextflow 

/*

This process is used to index the human genome using the minimap2 command.

*/

process MAPPING {
    
   // container 'community.wave.seqera.io/library/minimap2:2.28--78db3d0b6e5cb797'
    conda "${moduleDir}/environment.yml"
    publishDir "${params.outdir}", mode: 'copy'
   

    input:

    //path indexed_genome
   // path reads

   tuple val(id), path(reads), path(indexed_genome)

    
    output:

    path "${id}_unmmaped.fastq"

    script:

    """
    minimap2 -ax map-ont ${indexed_genome} ${reads} | \
        samtools view -b -f 4 | \
        samtools sort | \
        samtools fastq > ${id}_unmmaped.fastq
    """



}
