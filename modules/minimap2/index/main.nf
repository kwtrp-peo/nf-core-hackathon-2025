#!/usr/bin/env nextflow 


/*

This process is used to index the human genome using the minimap2 command.

*/
process HUMAN_INDEX {
    
   // container 'community.wave.seqera.io/library/minimap2:2.28--78db3d0b6e5cb797'
   conda '/Users/smusundi/anaconda3/envs/bioinfo'
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