tests - adding
testAddMethod
	| method |
	method := CBMethod new getter: 'item'.
	class addMethod: method.
	self assert: class metaMethods size equals: 0.
	self assert: class methods size equals: 1.
	self assert: class selectors equals: #(item).
	self assert: (class methodNamed: #item) equals: method