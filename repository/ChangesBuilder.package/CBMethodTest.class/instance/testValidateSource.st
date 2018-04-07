tests
testValidateSource
	self shouldnt: [ CBMethod new validateSource: 'a ^ 1' ] raise: CBSyntaxError