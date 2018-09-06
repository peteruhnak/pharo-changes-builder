tests
testFromRealClass
	| realClass |
	realClass := self class.
	class := CBClass fromClass: realClass.
	self assert: class instanceVariables equals: realClass instanceVariables.
	self assert: class parent equals: realClass superclass name.
	self assert: class package equals: realClass category