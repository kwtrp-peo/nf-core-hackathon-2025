#!/bin/bash


test_data=$1
#output_dir=$2

#mkdir -p ${output_dir}


for  dir in ${test_data}/*/

    do
    
    # extract the folder names containing individual samples 
    sample_id=$(basename ${dir})

    # print the sample names     
   # echo ${sample_id}

    # concatenate the fastq files in each folder 

   cat ${dir}/*.fastq.gz > ${sample_id}.fastq.gz

   # print the concatanated files 

   # echo ${output_dir}/${sample_id}.fastq.gz

done
