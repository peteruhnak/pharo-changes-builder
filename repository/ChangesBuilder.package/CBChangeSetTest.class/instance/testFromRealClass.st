tests
testFromRealClass
	| realClass class |
	realClass := self class.
	class := changeSet fromRealClass: realClass.
	self assert: class instanceVariables equals: realClass instanceVariables.
	self assert: class parent equals: realClass superclass name.
	self assert: changeSet classes asArray equals: {class}