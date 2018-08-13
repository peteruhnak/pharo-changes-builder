tests
testWithComment
	builder comments: {'hello' . 'world'}.
	self
		assert: builder buildComment
		equals:
			'"hello
	world"'