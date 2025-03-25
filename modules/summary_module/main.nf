#!/bin/env nextflow

nextflow.enable.dsl=2

/*

Group2 [ Writing Mash module for taxonomic classification ] --add your name below

----Developers-----
 
-Adolf Mukama
-Arnold Lambisia
-George
-Parcelli
-Agnetor


*/

process SUMMARY {
    tag "Summarizing MASH results"

    input:
    path mash_out_dir
    path summary_out_dir

    output:
    path "${summary_out_dir}/combined_results.tsv"

    script:
    """
    python process_results.py --input_dir $mash_out_dir --output_file ${summary_out_dir}/combined_results.tsv
    """
}
