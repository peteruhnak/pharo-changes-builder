Class {
	#name : #CBNautilusRefactoringChangesTest,
	#superclass : #TestCase,
	#category : 'ChangesBuilder-Tests'
}

{ #category : #support }
CBNautilusRefactoringChangesTest >> methodForTest [
]

{ #category : #tests }
CBNautilusRefactoringChangesTest >> testClassChanged [
	| cls change |
	cls := CBClass new
		name: #CBNautilusRefactoringChangesTest;
		parent: #TestCase.
	cls addInstVarNamed: 'var1'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges first.
	self deny: change textToDisplay = change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges isNotEmpty
]

{ #category : #tests }
CBNautilusRefactoringChangesTest >> testClassNotChanged [
	| cls change |
	cls := CBClass new
		name: #CBNautilusRefactoringChangesTest;
		parent: #TestCase.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges first.
	self assert: change textToDisplay equals: change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges isEmpty
]

{ #category : #tests }
CBNautilusRefactoringChangesTest >> testExample [
	| window |
	window := CBChangeSet example.
	window delete.
]

{ #category : #tests }
CBNautilusRefactoringChangesTest >> testMethodChanged [
	| cls change |
	cls := CBClass new name: self class name.
	cls compile: 'methodForTest' classified: 'not support'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges last.
	self deny: change textToDisplay = change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges size equals: 2
]

{ #category : #tests }
CBNautilusRefactoringChangesTest >> testMethodNotChanged [
	| cls change |
	cls := CBClass new name: self class name.
	cls compile: 'methodForTest' classified: 'support'.
	change := (CBChangeSet new addClass: cls) allRefactoringChanges last.
	self assert: change textToDisplay equals: change oldVersionTextToDisplay.
	self assert: (CBChangeSet new addClass: cls) refactoringChanges size equals: 1
]
