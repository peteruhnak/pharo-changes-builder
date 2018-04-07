tests
testValidateSourceError
	self should: [ CBMethod new validateSource: '^^' ] raise: CBSyntaxError