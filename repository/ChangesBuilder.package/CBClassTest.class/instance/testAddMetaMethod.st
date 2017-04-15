tests - adding
testAddMetaMethod
	class addMetaMethod: (CBMethod new getter: 'item').
	self assert: class metaMethods size equals: 1.
	self assert: class methods size equals: 0.
	self assert: class selectors equals: #()