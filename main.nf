include { samplesheetToList } 	from 'plugin/nf-schema' 
include { MASH_DB_DOWNLOAD } 	from './modules/mash/mash_db_download/main.nf' 
include { MASHSCREEN } 		from './modules/mash/mashscreen/main.nf' 
include { SUMMARY } 		from './modules/summary_module/main.nf'
include { COLLATE }      from   './modules/collate/main.nf'
include { HUMAN_INDEX }  from   './modules/minimap2/index/main.nf'
include { MAPPING }      from   './modules/minimap2/non_human_reads/main.nf'



// workflow

workflow {
    
  input_ch = Channel.fromPath(params.non_human_reads)

  input_ch=Channel.fromPath(params.test_data)


        COLLATE(input_ch)
                        .flatten()
                        .map{ file -> def sample_id=file.getBaseName(2)
                        return [sample_id, file]}
                        .set{collate_ch}
                        

   //collate_ch.view()

    human_ref_ch=Channel.fromPath(params.human_genome)

    indexed_ch=HUMAN_INDEX(human_ref_ch)

    //indexed_ch.view()

    indexed_reads_ch=collate_ch.combine(indexed_ch)

    MAPPING(indexed_reads_ch)



    // Conditional database selection


    if (!params.skip_dbdownload) {
        db_ch= MASH_DB_DOWNLOAD(params.url)
        db_ch.view()
        MASHSCREEN(
            MAPPING.out
                .map{
                file ->
                def sample_id = file.baseName
                return [sample_id,file]
            },
            db_ch)

            }
        else {
            db_ch = Channel.value(params.mash_sketch)
            MASHSCREEN(
            MAPPING.out
                .map{
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
