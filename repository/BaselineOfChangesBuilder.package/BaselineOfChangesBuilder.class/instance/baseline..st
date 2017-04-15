baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'ChangesBuilder' with: [  ].
			spec group: 'default' with: #('ChangesBuilder') ]