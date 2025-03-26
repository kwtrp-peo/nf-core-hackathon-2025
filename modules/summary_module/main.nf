#!/bin/env nextflow

nextflow.enable.dsl=2

/*

Group2 [ Writing Summary module for mash output ] --add your name below

----Developers-----
 
-Adolf Mukama
-Arnold Lambisia
-George
-Parcelli
-Agnetor


*/

process SUMMARY {
    tag "Summarizing MASH results"
    publishDir "${params.summary_out_dir}", mode: 'copy'

    input:
    path(files, stageAs: "folder/*")
    //path summary_out_dir
    //path mash_out_dir

    output:
    path "combined_results.tsv"

    script:
    """
    mkdir mash_out_dir
    mv ${files} mash_out_dir
    module_summary_v3.py \
        --input_dir mash_out_dir \
        --output_file combined_results.tsv
    """
}
