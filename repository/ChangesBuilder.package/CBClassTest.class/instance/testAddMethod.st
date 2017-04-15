tests - adding
testAddMethod
	class addMethod: (CBMethod new getter: 'item').
	self assert: class metaMethods size equals: 0.
	self assert: class methods size equals: 1.
	self assert: class selectors equals: #(item)