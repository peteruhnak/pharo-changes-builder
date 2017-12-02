tests
testClassNamed
	| class |
	class := changeSet classNamed: 'Unit'.
	self assert: class name equals: 'Unit'.
	self assert: changeSet classes asArray equals: {class}