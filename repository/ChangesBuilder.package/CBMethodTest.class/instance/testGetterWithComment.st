tests
testGetterWithComment
	method := CBMethod new getter: 'var' comment: 'comment'.
	self
		assertMethod: method source
		equals:
			'var
	"comment"
	^ var'.
	self assert: method protocol equals: 'accessing'