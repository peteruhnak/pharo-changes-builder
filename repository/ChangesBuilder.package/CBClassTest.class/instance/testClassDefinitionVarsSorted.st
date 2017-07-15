tests
testClassDefinitionVarsSorted
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	class addInstVarNamed: 'var2'.
	class addInstVarNamed: 'var1'.
	class addClassVarNamed: 'clsVar2'.
	class addClassVarNamed: 'clsVar1'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''var1 var2''<n><t>classVariableNames: ''clsVar1 clsVar2''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros