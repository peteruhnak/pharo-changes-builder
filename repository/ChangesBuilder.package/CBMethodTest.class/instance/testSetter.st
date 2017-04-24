tests
testSetter
	method := CBMethod new setter: 'var' argument: 'variable'.
	self
		assertMethod: method source
		equals:
			'var: aVariable
	var := aVariable'.
	self assert: method protocol equals: 'accessing'