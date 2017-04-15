tests - accessing
testRealClass
	class name: self class name.
	self assert: class realClass equals: self class.
	class name: 'ThereIsNoSuchClassInTheSystem'.
	self assert: class realClass equals: nil