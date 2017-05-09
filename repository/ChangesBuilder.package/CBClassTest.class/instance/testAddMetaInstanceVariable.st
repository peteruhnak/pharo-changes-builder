tests - adding
testAddMetaInstanceVariable
	class addMetaInstVarNamed: 'something'.
	self assert: class metaInstanceVariables equals: #(something).
	self assert: (class hasMetaInstVarNamed: 'something')