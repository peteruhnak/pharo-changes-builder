tests
testAddLine
	builder := CBMethodBuilder new.
	builder addLine: 'first'.
	self assert: builder source equals: 'first
'.
	builder addLine: 'second'.
	self assert: builder source equals: 'first
second
'