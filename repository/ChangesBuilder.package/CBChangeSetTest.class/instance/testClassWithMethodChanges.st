running
testClassWithMethodChanges
	| class |
	class := CBClass new name: 'GeneratedClass'.
	class
		addMethod:
			(CBMethod new
				source: 'meth ^ 1';
				protocol: 'my protocol').
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}.
	self
		assert: changeSet allRefactoringChanges second textToDisplay
		equals:
			'"my protocol"
meth ^ 1'