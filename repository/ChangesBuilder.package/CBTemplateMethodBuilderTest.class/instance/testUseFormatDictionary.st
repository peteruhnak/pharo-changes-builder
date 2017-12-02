tests
testUseFormatDictionary
	builder useFormat.
	builder template: 'hello{name}'.
	self assert: (builder sourceOn: {'name' -> 'You'} asDictionary) equals: 'helloYou'