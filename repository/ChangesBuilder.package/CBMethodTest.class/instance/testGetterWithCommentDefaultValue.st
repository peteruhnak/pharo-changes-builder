tests
testGetterWithCommentDefaultValue
	method := CBMethod new getter: 'var' comment: 'comment' defaultValue: '12'.
	self
		assertMethod: method source
		equals:
			'var
	"comment"
	^ var ifNil: [ var := 12 ]'.
	self assert: method protocol equals: 'accessing'