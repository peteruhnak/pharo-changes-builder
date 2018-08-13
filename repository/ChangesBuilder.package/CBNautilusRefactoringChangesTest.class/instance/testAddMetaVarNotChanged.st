tests
testAddMetaVarNotChanged
	| cls change |
	cls := CBClass new
		name: #CBNautilusRefactoringChangesTest;
		parent: #TestCase;
		package: 'ChangesBuilder-Tests'.
	cls addMetaInstVarNamed: 'metaVar1'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges last.
	self assert: change textToDisplay = change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges isEmpty