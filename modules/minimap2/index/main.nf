#!/usr/bin/env nextflow 


/*

This process is used to index the human genome using the minimap2 command.

*/
process HUMAN_INDEX {
    
   conda "${moduleDir}/environment.yml"
   container 'oras://community.wave.seqera.io/library/minimap2:2.28--74e328e3ff3fa395'

    publishDir "${params.outdir}", mode: 'copy'
    memory '8 GB'
  


    input:

    path human_genome

    
    output:
    path "${human_genome.baseName}.mmi"

    script:

    """
    minimap2 -d ${human_genome.baseName}.mmi ${human_genome}
    """



}