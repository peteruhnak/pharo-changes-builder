tests
testGetterWithDefaultValue
	method := CBMethod new getter: 'var' defaultValue: '12'.
	self
		assertMethod: method source
		equals:
			'var
	^ var ifNil: [ var := 12 ]'.
	self assert: method protocol equals: 'accessing'