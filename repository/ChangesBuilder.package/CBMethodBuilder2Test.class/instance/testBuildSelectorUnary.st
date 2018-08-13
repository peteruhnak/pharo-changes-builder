tests
testBuildSelectorUnary
	builder
		argument: 'Object';
		selector: 'object'.
	self assertMethod: builder buildSelector equals: 'object'