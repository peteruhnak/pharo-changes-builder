tests
testClassChanged
	| cls change |
	cls := CBClass new
		name: #CBNautilusRefactoringChangesTest;
		parent: #TestCase.
	cls addInstVarNamed: 'var1'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges first.
	self deny: change textToDisplay = change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges isNotEmpty