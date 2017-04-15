tests - accessing
testComment
	self assert: class comment equals: nil.
	class comment: 'hello'.
	self assert: class comment equals: 'hello'