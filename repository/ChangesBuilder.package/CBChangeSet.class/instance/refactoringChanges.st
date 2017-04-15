converting
refactoringChanges
	^ self allRefactoringChanges
		reject: [ :each | each textToDisplay = each oldVersionTextToDisplay ]