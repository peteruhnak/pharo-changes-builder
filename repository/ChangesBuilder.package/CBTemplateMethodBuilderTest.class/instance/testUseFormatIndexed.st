tests
testUseFormatIndexed
	builder useFormat.
	builder template: 'hello{1}'.
	self assert: (builder sourceOn: {'You'}) equals: 'helloYou'