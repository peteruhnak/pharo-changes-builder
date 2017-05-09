tests
testAddIndent
	builder := CBMethodBuilder new.
	builder addLine: 'first'.
	self
		assert: builder source
		equals:
			'first
'.
	builder addIndent.
	builder addLine: 'second'.
	self
		assert: builder source
		equals:
			'first
	second
'.
	builder addIndent.
	builder addLine: 'third'.
	self
		assert: builder source
		equals:
			'first
	second
		third
'