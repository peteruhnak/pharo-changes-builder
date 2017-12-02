tests
testSource
	self
		assert:
			(builder
				template: 'hello';
				source)
		equals: 'hello'