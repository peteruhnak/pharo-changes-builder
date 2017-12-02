tests
testUseMacros
	builder useMacros.
	builder template: 'hello<1s>'.
	self assert: (builder sourceOn: {'You'}) equals: 'helloYou'