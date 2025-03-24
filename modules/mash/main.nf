/*

Group2 [ Writing Mash module for taxonomic classification ] --add your name below

----Developers-----
 
-Adolf Mukama
-Arnold Lambisia


*/

process MASH {
	

	conda "${moduleDir}/environment.yml"
        container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        	'oras://community.wave.seqera.io/library/mash:2.3--c57e992e33e8b841' :
        	'community.wave.seqera.io/library/mash:2.3--1b742dfaa6515b6e' }"


	input:




	output:



	script:

	"""

	"""

}
