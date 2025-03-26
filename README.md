
# Kilifi, Kenya Site 2025 Hackathon Repository

This project utilizes raw fastq barcode reads, maps, screens and drops human reads (host reads) and taxonomically classifies the resulting reads

The pipeline is built using [Nextflow](https://github.com/nextflow-io/nextflow), a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It comes with singularity and docker containers, making installation of tools and running quite easy

# Pipeline Summary
1. Download human genome (```wget```)
2. Human genome indexing (```Minimap```)
3. Read mapping and removal of human reads (```Minimap```)
4. Taxonomic classification (```Mash```)
   
   . Download mash database if not provided
   
   . Screen and taxonomically classify the reads

# Quick Start

## Prerequisites 

To set up, make sure you have: 

**Docker/Singularity**, container platforms that help you install and run various tools in this workflow
