rule get_rulegraph:
	output:
		"dags/rulegraph.svg",
		"dags/rulegraph.png",
		# "dags/dag.svg",
		# "dags/dag.png"
	shell:
		"bash workflow/scripts/rules_dag.sh"
