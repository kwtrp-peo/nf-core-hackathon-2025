#!/bin/env nextflow

nextflow.enable.dsl=2

/*

Group2 [ Writing Mash module for taxonomic classification ] --add your name below

----Developers-----
 
-Adolf Mukama
-Arnold Lambisia


*/

process MASHSCREEN {
	
    tag "sample_id"

    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        	'oras://community.wave.seqera.io/library/mash:2.3--1c2e0d1323ded1d2' :
        	'community.wave.seqera.io/library/mash:2.3--1c2e0d1323ded1d2' }"
    
    publishDir "${params.mash_out_dir}", mode: 'copy'
    
    input:

    tuple val(sample_id), path(non_human_reads) //gets non_human_reads fastq files from the  minimap process
    val database

    output:
    path "${sample_id}.txt"                          , emit: results // Mash distance output
    path "versions.yml"                              , emit: versions, optional: true

    script:

    """
    
    mash screen -w ${database} ${non_human_reads} > ${sample_id}.tab
    sort -gr ${sample_id}.tab > ${sample_id}.txt

    """
    


   stub:
   """
   cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        mash: \$( mash --version )
    END_VERSIONS
   """
}
