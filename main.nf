include { samplesheetToList } 	from 'plugin/nf-schema' 
include { MASH_DB_DOWNLOAD } 	from './modules/mash/mash_db_download/main.nf' 
include { MASHSCREEN } 		from './modules/mash/mashscreen/main.nf ' 
include { SUMMARY } 		from './modules/summary_module/main.nf'







// workflow

workflow {
    // Conditional database selection

    if (!params.skip_dbdownload) {
        db_ch= MASH_DB_DOWNLOAD(params.database)
        db_ch.view()
        //process_data(db_ch)

            }
        else {
            db_ch = Channel.value(params.db)
            db_ch.view()
 

        }
}
