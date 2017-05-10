tests
testComment
	builder := CBMethodBuilder new.
	builder addComment: 'first'.
	self
		assert: builder source
		equals:
			'"first"
'