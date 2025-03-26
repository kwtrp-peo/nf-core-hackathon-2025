# Mapping and removal of Human reads     

## overview
**This Module is for used to map sequencing  reads to the human genome and then filter out those mapping to obtain the non-human reads.**      

## Parameters  

### Input
- **indexed human genome**: Takes a path to an already indexed human genome in the **(.fna,.fa)** format.   
- **combined reads**: concatenated sequencing reads **(in .fastq format)** processed from the previous *_ collate module _*.    

### Output
- The expected output is the **non-human reads** in a **(.fastq)** format.

## Process

- **Mapping with Minimap2:**
  The first process uses Minimap2 to map the reads to the reference human genome.
- **Filtering with samtools:**
  After mapping the reads we use **Samtools** to filter out those reads that did not map to the human genome, we sort the reads by the reads name and convert them from a **(bam/sam)** format to
  a **(.fastq)** format.
  

## Citation
> Twelve years of SAMtools and BCFtools </br>
> Petr Danecek, James K Bonfield, Jennifer Liddle, John Marshall, Valeriu Ohan, Martin O Pollard, Andrew Whitwham, Thomas Keane, Shane A McCarthy, Robert M Davies, Heng Li </br>
> _GigaScience_, Volume 10, Issue 2, February 2021, giab008, https://doi.org/10.1093/gigascience/giab008
