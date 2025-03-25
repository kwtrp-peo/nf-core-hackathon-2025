#!/usr/bin/env nextflow
/*
Creating a nextflow pipeline to downloaded a database
*/
//set a default value to null

params.skip_dbdownload = false
params.db = null
params.database = "https://gembox.cbcb.umd.edu/mash/refseq.genomes.k21s1000.msh"

process download_database {
    input :
    val database
    
    output:
    path "default_db.msh", emit: db

    when:
    !params.skip_dbdownload

    script:
    """
    wget -O default_db.msh ${database}
    """
}
process process_data {
    input:
    val database

    output:
    stdout
 
    script:
    """
    echo "Using database: $database"
    """
}
workflow {
    // Conditional database selection
    
    if (!params.skip_dbdownload) {
        db_ch= download_database(params.database)
        process_data(db_ch)
    
            } 
        else {
             db_ch = Channel.value(params.db)
        process_data(db_ch)
        process_data.out.view()
   

        }
}
