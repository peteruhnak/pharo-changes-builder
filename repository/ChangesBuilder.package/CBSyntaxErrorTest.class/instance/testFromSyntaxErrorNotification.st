tests
testFromSyntaxErrorNotification
	| error notification |
	notification := SyntaxErrorNotification new
		setClass: self class
		code: 'code'
		doitFlag: false
		errorMessage: 'message'
		location: 3.
	error := CBSyntaxError fromSyntaxErrorNotification: notification.
	self assert: error errorCode equals: 'code'.
	self assert: error location equals: 3.
	self assert: error messageText equals: 'message'