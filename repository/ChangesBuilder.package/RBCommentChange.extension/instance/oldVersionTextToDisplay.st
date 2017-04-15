*ChangesBuilder
oldVersionTextToDisplay
	| cls |
	(Smalltalk hasClassNamed: className)
		ifFalse: [ ^ '' ].
	cls := Smalltalk classNamed: className.
	^ cls hasComment
		ifTrue: [ cls comment ]
		ifFalse: [ '' ]