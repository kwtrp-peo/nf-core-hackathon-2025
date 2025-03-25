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
        	'oras://community.wave.seqera.io/library/mash:2.3--c57e992e33e8b841' :
        	'community.wave.seqera.io/library/mash:2.3--1b742dfaa6515b6e' }"
    
    publishDir params.mash_output_dir, mode: 'copy'
    
    input:

    tuple val(sample_id), path(non_human_reads) //gets non_human_reads fastq files from the  minimap process

	  output:
	  path "results/${sample_id}.tab", emit: results	// Mash distance output
	  path "results/${sample_id}_taxonomy.tsv", emit: results		// Final taxonomic classification
	  path "results/${sample_id}_summary.html", emit: results        // Summary report


    script:

    """
    mkdir results

    """

}
