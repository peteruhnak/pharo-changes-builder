tests
testClassDefinitionWithInstanceVars
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	class addInstVarNamed: 'var1'.
	class addInstVarNamed: 'var2'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''var1 var2''<n><t>classVariableNames: ''''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros