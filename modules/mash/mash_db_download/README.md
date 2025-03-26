# MASH Database Download Module

## Overview
This Nextflow module provides functionality for downloading a reference database for MASH (Minhash Adaptive Sketch), a fast genome and metagenome distance estimation tool.

## Parameters

### Input Parameters
- `params.skip_dbdownload` (boolean, default: `false`)
  - Controls whether the database download process should be skipped
  - When set to `true`, the module will use a pre-existing database
  - When `false` (default), the module will download the default database

- `params.db` (string, default: `null`)
  - Path to a pre-existing database file
  - Used when `skip_dbdownload` is set to `true`

- `params.database` (string, default: `"https://gembox.cbcb.umd.edu/mash/refseq.genomes.k21s1000.msh"`)
  - URL of the default MASH reference database to be downloaded
  - Defaults to a RefSeq genome database

## Workflow

### Database Download Process
1. The module checks if `skip_dbdownload` is `false`
2. If download is not skipped:
   - Downloads the database from the specified URL
   - Saves the downloaded database as `default_db.msh`
3. If download is skipped:
   - Uses the user-provided database path from `params.db`

## Process: `download_database`

### Inputs
- `database`: URL of the database to be downloaded

### Outputs
- `default_db.msh`: Downloaded MASH database file

### Execution Condition
- Process runs only when `!params.skip_dbdownload` is true

## Usage Examples

### Default Download
```bash
nextflow run script.nf
```

### Skip Database Download
```bash
nextflow run script.nf --skip_dbdownload true --db /path/to/custom/database.msh
```

### Specify Alternative Database URL
```bash
nextflow run script.nf --database https://alternative-database-url.com/database.msh
```

## Notes
- Ensure wget is installed in your execution environment
- The default database is a RefSeq genome sketch from the University of Maryland
- Database download may take time depending on your internet connection

## Dependencies
- Nextflow
- wget

## Troubleshooting
- If download fails, check:
  1. Internet connectivity
  2. Database URL accessibility
  3. Wget installation

## Version
- Current Module Version: 1.0.0
- Last Updated: March 2025
