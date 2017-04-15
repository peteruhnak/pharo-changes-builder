converting
allRefactoringChanges
	| model |
	model := RBNamespace new.
	classes
		do: [ :each | 
			| cls meta |
			model defineClass: each classDefinition.
			cls := model classNamed: each name asSymbol.
			each comment ifNotNil: [ model comment: each comment in: cls ].
			each methods do: [ :method | cls compile: method source classified: method protocol ].
			meta := cls theMetaClass.
			each metaMethods
				do: [ :method | meta compile: method source classified: method protocol ] ].
	^ model changes changes