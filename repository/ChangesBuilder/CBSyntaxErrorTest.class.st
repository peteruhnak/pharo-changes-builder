Class {
	#name : #CBSyntaxErrorTest,
	#superclass : #TestCase,
	#category : 'ChangesBuilder-Tests'
}

{ #category : #tests }
CBSyntaxErrorTest >> testFromSyntaxErrorNotification [
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
]

{ #category : #tests }
CBSyntaxErrorTest >> testStyledErrorMessage [
	| error  |
	error := CBSyntaxError new setCode: 'code' location: 1 errorMessage: 'reason'.
	self
		assert: error styledErrorMessage
		equals: ('reason -> ' asText allBold makeAllColor: Color red) , 'code'
]
