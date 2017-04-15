tests
testGetter
	method := CBMethod new getter: 'var'.
	self
		assert: method source
		equals:
			'var
	^ var'.
	self assert: method protocol equals: 'accessing'