include { samplesheetToList } 	from 'plugin/nf-schema' 
include { MASH_DB_DOWNLOAD } 	from './modules/mash/mash_db_download/main.nf' 
include { MASHSCREEN } 		from './modules/mash/mashscreen/main.nf ' 
include { SUMMARY } 		from './modules/summary_module/main.nf'







// workflow

MASHSCREEN()
MASH_DB_DOWNLOAD()
SUMMARY()
