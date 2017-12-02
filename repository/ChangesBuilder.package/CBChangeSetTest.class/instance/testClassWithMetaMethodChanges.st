tests
testClassWithMetaMethodChanges
	| class methodRefactoring |
	class := CBClass new name: 'GeneratedClass'.
	class
		addMetaMethod:
			(CBMethod new
				source: 'meth ^ 1';
				protocol: 'my protocol').
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}.
	methodRefactoring := changeSet allRefactoringChanges second.
	self assert: methodRefactoring isMeta.
	self
		assert: methodRefactoring textToDisplay
		equals:
			'"my protocol"
meth ^ 1'