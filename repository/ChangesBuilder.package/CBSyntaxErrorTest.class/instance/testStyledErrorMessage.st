tests
testStyledErrorMessage
	| error  |
	error := CBSyntaxError new setCode: 'code' location: 1 errorMessage: 'reason'.
	self
		assert: error styledErrorMessage
		equals: ('reason -> ' asText allBold makeAllColor: Color red) , 'code'