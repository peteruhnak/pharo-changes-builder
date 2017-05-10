tests
testAddComment
	builder := CBMethodBuilder new.
	builder addComment: 'hello'.
	self assert: (builder asComment: 'text') equals: 'text'.
	self assert: (builder asComment: 't"e"xt') equals: 't""e""xt'