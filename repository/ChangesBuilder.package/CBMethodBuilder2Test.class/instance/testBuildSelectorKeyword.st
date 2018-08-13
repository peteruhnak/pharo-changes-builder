tests
testBuildSelectorKeyword
	builder
		arguments:
			{'Fraction'.
			Integer};
		selector: 'add:to:'.
	self assertMethod: builder buildSelector equals: 'add: aFraction to: anInteger'