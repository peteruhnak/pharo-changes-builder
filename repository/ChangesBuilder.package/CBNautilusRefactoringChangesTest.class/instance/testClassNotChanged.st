tests
testClassNotChanged
	| cls change |
	cls := CBClass new
		name: #CBNautilusRefactoringChangesTest;
		parent: #TestCase;
		package: 'ChangesBuilder-Tests'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges first.
	self assert: change textToDisplay equals: change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges isEmpty