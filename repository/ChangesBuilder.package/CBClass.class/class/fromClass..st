instance creation
fromClass: aRealClass
	| class |
	(class := self new)
		name: aRealClass name;
		parent: aRealClass superclass name;
		package: aRealClass category asString.
	aRealClass instanceVariables do: [ :each | class addInstVarNamed: each ].
	aRealClass classVariables do: [ :each | class addClassVarNamed: each ].
	aRealClass class instanceVariables do: [ :each | class addMetaInstVarNamed: each ].
	^ class