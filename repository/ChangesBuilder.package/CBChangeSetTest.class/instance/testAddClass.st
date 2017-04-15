running
testAddClass
	| class |
	class := CBClass new name: 'GeneratedClass'.
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}