tests
testCreate
	result := CBClass name: 'MyClass' parent: 'Something' package: 'Generated'.
	self assert: result name equals: 'MyClass'.
	self assert: result parent equals: 'Something'.
	self assert: result package equals: 'Generated'