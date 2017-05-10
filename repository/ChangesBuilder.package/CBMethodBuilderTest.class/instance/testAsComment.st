tests
testAsComment
	builder := CBMethodBuilder new.
	self assert: (builder asComment: 'text') equals: 'text'.
	self assert: (builder asComment: 't"e"xt') equals: 't""e""xt'