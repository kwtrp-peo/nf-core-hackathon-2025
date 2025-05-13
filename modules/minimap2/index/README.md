# Indexing the Human genome using minimap2

## Overview

The main objective of this module is to perform indexing of human genome reference file using `minimap2 software` and the output is an index file 
with **_.mmi_** extension. 

The input raw reads from collate module are mapped against the generated index file using the `minimap2` to filter out human reads.

## Parameters

### Input parameters

A path to the location of the human genome reference fasta file (with, **_.fasta, .fna, or .fa_** extension).

## Workflow

**Step 1**: Downloads the latest human genome reference.

**Step 2**: Indexing Uses `minimap2` to generate an indexed reference genome file.

## Process : Indexing

### Input
- `Path/to/Human_genome_ref`; a path to the location of the downloaded reference file.

### Output
- An indexed file of  human genome reference (with **_.mmi_**  extension)

### Version
- current version: 2.28
- Released: Mar 27, 2024
  
### Citation
Li, H. (2018). Minimap2: pairwise alignment for nucleotide sequences. Bioinformatics, 34:3094-3100. https://doi.org/10.1093/bioinformatics/bty191
