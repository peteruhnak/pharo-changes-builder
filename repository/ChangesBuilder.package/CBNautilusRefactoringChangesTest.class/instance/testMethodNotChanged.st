tests
testMethodNotChanged
	| cls change |
	cls := CBClass new name: self class name.
	cls compile: 'methodForTest' classified: 'support'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges last.
	self assert: change textToDisplay equals: change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges size equals: 1