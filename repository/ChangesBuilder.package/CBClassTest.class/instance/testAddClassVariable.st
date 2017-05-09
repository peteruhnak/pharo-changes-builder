tests - adding
testAddClassVariable
	class addClassVarNamed: 'something'.
	self assert: class classVariables equals: #(something).
	self assert: (class hasClassVarNamed: 'something')