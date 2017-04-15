tests
testClassDefinition
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''''<n><t>classVariableNames: ''''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros