#!/usr/bin/env nextflow
/*
Creating a nextflow pipeline to downloaded a database
*/

process MASH_DB_DOWNLOAD {

    tag "downloading mash database"
    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        	'oras://community.wave.seqera.io/library/wget:1.21.4--bdfafa9657278470' :
        	'community.wave.seqera.io/library/wget:1.21.4--bdfafa9657278470' }"
    
    input:
    val url
    
    output:
    path "default_db.msh", emit: db

    when:
    !params.skip_dbdownload

    script:
    """
    
    wget -O default_db.msh ${url}
    """
}

