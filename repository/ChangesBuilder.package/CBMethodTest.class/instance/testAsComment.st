tests
testAsComment
	method := CBMethod new.
	self assert: (method asComment: 'text') equals: 'text'.
	self assert: (method asComment: 't"e"xt') equals: 't""e""xt'.