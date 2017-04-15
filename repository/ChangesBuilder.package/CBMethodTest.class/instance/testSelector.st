tests
testSelector
	method := CBMethod new source: 'a: aWhatever ^ nil'.
	self assert: method selector equals: #a: