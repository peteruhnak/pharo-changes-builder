tests
testClassNamedSame
	| classA classB |
	classA := changeSet classNamed: 'Unit'.
	classB := changeSet classNamed: 'Unit'.
	self assert: classA == classB