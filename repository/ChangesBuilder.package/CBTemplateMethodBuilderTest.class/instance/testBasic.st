tests
testBasic
	method := builder
		template: 'hello';
		protocol: 'my-protocol';
		method.
	self assert: method protocol equals: 'my-protocol'.
	self assert: method source equals: 'hello'