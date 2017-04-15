tests
testMethodChanged
	| cls change |
	cls := CBClass new name: self class name.
	cls compile: 'methodForTest' classified: 'not support'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges last.
	self deny: change textToDisplay = change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges size equals: 2