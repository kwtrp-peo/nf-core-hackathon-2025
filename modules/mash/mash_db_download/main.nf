#!/usr/bin/env nextflow
/*
Creating a nextflow pipeline to downloaded a database
*/

process MASH_DB_DOWNLOAD {

    tag "downloading mash database"

    input:
    val database
    
    output:
    path "default_db.msh", emit: db

    when:
    !params.skip_dbdownload

    script:
    """
    echo "Downloading a database"
    wget -O default_db.msh ${database}
    """
}

