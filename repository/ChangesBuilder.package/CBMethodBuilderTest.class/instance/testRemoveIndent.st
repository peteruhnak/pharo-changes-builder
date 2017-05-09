tests
testRemoveIndent
	builder := CBMethodBuilder new.
	builder addIndent.
	builder addLine: 'first'.
	self
		assert: builder source
		equals:
			'	first
'.
	builder removeIndent.
	builder addLine: 'second'.
	self
		assert: builder source
		equals:
			'	first
second
'