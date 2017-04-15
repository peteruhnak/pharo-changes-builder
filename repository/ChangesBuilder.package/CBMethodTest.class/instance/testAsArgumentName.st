tests
testAsArgumentName
	method := CBMethod basicNew.
	self assert: (method asArgumentName: 'dog') equals: 'aDog'.
	self assert: (method asArgumentName: 'old') equals: 'anOld'