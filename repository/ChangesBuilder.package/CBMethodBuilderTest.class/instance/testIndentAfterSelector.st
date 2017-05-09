tests
testIndentAfterSelector
	builder := CBMethodBuilder new.
	builder selector: 'first'.
	builder addLine: 'second'.
	self assert: builder source equals: 'first
	second
'