#!/usr/bin/env nextflow

process COLLATE {
    publishDir "${params.outdir}", mode: 'copy'


    input:

    path reads

    output:

    path "*"


    script:

    """
    bash concatanate.sh ${reads}
    """

}