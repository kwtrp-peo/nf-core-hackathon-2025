# Indexing the Human genome using minimap2

## Overview

The main objective of the indexing module is to provide a link for the downloading the latest human genome and then perform indexing using minimap2 outputting a file 
with **_.mmi extension_**. The generated index file is used for efficient sequence alignment in downstream processes.

## Parameters

### Input parameters

Path to the location of the human genome fasta file (**_with .fna or .fa extension_**).

## Workflow

**Preprocessing**: Downloading the latest reference human genome

**Indexing**: Use minimap2 to generate an indexed reference genome file.

## Process : Indexing

### Input
Human genome (Path to the location of the downloaded reference file)

### Output
out put dir for Indexed human genome (with **_.mmi extension_**)

### Version
- current version: 2.28
- Released: Mar 27, 2024
  
### Citation
Li, H. (2018). Minimap2: pairwise alignment for nucleotide sequences. Bioinformatics, 34:3094-3100. https://doi.org/10.1093/bioinformatics/bty191
