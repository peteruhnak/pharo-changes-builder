tests - adding
testCompileMetaMethod
	class
		compileMeta:
			'item
	^ item'
		classified: 'accessing'.
	self assert: class methods size equals: 0.
	self assert: class metaMethods size equals: 1.
	self assert: class metaMethods first protocol equals: 'accessing'.
	self
		assert: class metaMethods first source
		equals:
			'item
	^ item'