tests - accessing
testParent
	class := CBClass new.
	self assert: class parent equals: nil.
	class parent: 'Object'.
	self assert: class parent equals: 'Object'