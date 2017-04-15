running
testAddClassChanges
	| class |
	class := CBClass new name: 'GeneratedClass'.
	class addInstVarNamed: 'var1'.
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}.
	self
		assert: changeSet allRefactoringChanges first textToDisplay withUnixLineEndings
		equals:
			'Object subclass: #GeneratedClass
	instanceVariableNames: ''var1''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''Unclassified''' withUnixLineEndings