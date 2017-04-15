tests - accessing
testParent
	class := CBClass new.
	self assert: class parent equals: 'Object'.
	class parent: 'TestCase'.
	self assert: class parent equals: 'TestCase'