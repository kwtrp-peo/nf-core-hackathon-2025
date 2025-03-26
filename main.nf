include { samplesheetToList } 	from 'plugin/nf-schema' 
include { MASH_DB_DOWNLOAD } 	from './modules/mash/mash_db_download/main.nf' 
include { MASHSCREEN } 		from './modules/mash/mashscreen/main.nf' 
include { SUMMARY } 		from './modules/summary_module/main.nf'







// workflow

workflow {
    input_ch = Channel.fromPath(params.non_human_reads)
    if (!params.skip_dbdownload) {
        db_ch= MASH_DB_DOWNLOAD(params.url)
        db_ch.view()
        MASHSCREEN(
            input_ch.map{
                file ->
                def sample_id = file.baseName
                return [sample_id,file]
            },
            db_ch)

            }
        else {
            db_ch = Channel.value(params.mash_sketch)
            MASHSCREEN(
            input_ch.map{
                file ->
                def sample_id = file.baseName
                return [sample_id,file]
            },
            db_ch)
 
    SUMMARY(MASHSCREEN.out
                .results
                .collect()
                .view()
                )
        }

       // SUMMARY(params.test_sum)
}
