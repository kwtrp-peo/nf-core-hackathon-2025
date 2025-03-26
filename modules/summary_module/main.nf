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

    input:
    path(files, stageAs: "folder/*")
    path summary_out_dir

    output:
    path "${summary_out_dir}/combined_results.tsv"

    script:
    """
    mkdir mash_out_dir
    mv ${files}/* mash_out_dir
    python process_results.py --input_dir mash_out_dir --output_file ${summary_out_dir}/combined_results.tsv
    """
}
