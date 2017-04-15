tests - adding
testAddVariable
	class addInstVarNamed: 'something'.
	self assert: class instanceVariables equals: #(something).
	self assert: (class hasInstVarNamed: 'something')