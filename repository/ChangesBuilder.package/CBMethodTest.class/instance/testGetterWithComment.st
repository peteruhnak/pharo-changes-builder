tests
testGetterWithComment
	method := CBMethod new getter: 'var' comment: 'comment'.
	self
		assert: method source
		equals:
			'var
	"comment"
	^ var'.
	self assert: method protocol equals: 'accessing'