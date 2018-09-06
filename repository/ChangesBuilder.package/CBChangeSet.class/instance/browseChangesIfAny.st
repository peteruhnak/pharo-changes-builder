actions
browseChangesIfAny
	self refactoringChanges ifEmpty: [ ^ self inform: 'No changes' ].
	^ self browseChanges