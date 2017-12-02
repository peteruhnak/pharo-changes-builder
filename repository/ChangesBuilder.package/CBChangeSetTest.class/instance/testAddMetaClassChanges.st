tests
testAddMetaClassChanges
	| class |
	class := CBClass new name: 'GeneratedClass'.
	class addMetaInstVarNamed: 'metaVar1'.
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}.
	self
		assert: changeSet allRefactoringChanges second textToDisplay withUnixLineEndings
		equals: 'Add instance variable metaVar1 to GeneratedClass class'