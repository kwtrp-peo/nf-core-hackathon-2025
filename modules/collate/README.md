# Collate module

## Overview
This module merges fastq files in a sample.
The module takes the folder path containing unaggregrated Nanopore FASTQ files for a single barcode as the input and outputs one merged fastq file for each sample.
The `flatten` operator ensures that the output, originally in list form, is emitted as separate entries for easier accessibility by other processes.
Additionally `map` operator was used to transform the flattened output to obtain sample ID and file path, then `set` operator was used to rename the sample names.

## Parameters
`params.outdir` This specifies the path to the output directory with the merged fastq file.
