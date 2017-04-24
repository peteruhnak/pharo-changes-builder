tests
testSetterWithComment
	method := CBMethod new setter: 'var' argument: 'variable' comment: 'hello'.
	self
		assertMethod: method source
		equals:
			'var: aVariable
	"hello"
	var := aVariable'.
	self assert: method protocol equals: 'accessing'