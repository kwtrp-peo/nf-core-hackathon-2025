#!/usr/bin/env nextflow 



process HUMAN_GENOME_DOWNLOAD {

    tag "Download the human genome"
    conda "${moduleDir}/environment.yml"
    
    input:
    val url

    output:

    path "human_genome.fna.gz" , emit: db


    when:
    !params.skip_dbdownload

    script:

    """

    wget --no-check-certificate ${url} -O human_genome.fna.gz
    """
}