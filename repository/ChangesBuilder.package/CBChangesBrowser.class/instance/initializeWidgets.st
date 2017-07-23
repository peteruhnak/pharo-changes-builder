initialization
initializeWidgets
	super initializeWidgets.
	diffModel := self newDiff.
	self focusOrder add: diffModel