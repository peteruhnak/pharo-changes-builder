tests
testSelector
	builder := CBMethodBuilder new.
	builder selector: 'first'.
	self assert: builder source equals: 'first
'