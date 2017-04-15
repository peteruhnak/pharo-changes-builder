"
Baseline for https://github.com/peteruhnak/pharo-changes-builder
"
Class {
	#name : #BaselineOfChangesBuilder,
	#superclass : #BaselineOf,
	#category : 'BaselineOfChangesBuilder'
}

{ #category : #baselines }
BaselineOfChangesBuilder >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'ChangesBuilder' with: [  ].
			spec group: 'default' with: #('ChangesBuilder') ]
]
