tests
testMethodNotChanged
	| cls change |
	cls := CBClass new name: self class name.
	cls compile: 'methodForTest
	"do not delete me, I am used in #testMethodNotChanged"' classified: 'support'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges last.
	self assert: change textToDisplay equals: change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges size equals: 1