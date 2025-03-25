/*

Group2 [ Writing Mash module for taxonomic classification ] --add your name below

----Developers-----
 
-Adolf Mukama
-


*/

process MASH {

	input:




	output:
path "results/${sample_id}_mash_distances.tab", emit: results	// Mash distance output
path "results/${sample_id}_taxonomy.tsv", emit: results		// Final taxonomic classification
path "results/${sample_id}_summary.html", emit: results        // Summary report


	script:

	"""
mkdir results

	"""

}
