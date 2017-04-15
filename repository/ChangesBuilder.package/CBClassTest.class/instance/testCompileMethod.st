tests - adding
testCompileMethod
	class
		compile:
			'item
	^ item'
		classified: 'accessing'.
	self assert: class metaMethods size equals: 0.
	self assert: class methods size equals: 1.
	self assert: class selectors equals: #(item).
	self assert: class methods first protocol equals: 'accessing'.
	self
		assert: class methods first source
		equals:
			'item
	^ item' expandMacros