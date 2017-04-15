Extension { #name : #RBCommentChange }

{ #category : #'*ChangesBuilder' }
RBCommentChange >> oldVersionTextToDisplay [
	| cls |
	(Smalltalk hasClassNamed: className)
		ifFalse: [ ^ '' ].
	cls := Smalltalk classNamed: className.
	^ cls hasComment
		ifTrue: [ cls comment ]
		ifFalse: [ '' ]
]

{ #category : #'*ChangesBuilder' }
RBCommentChange >> textToDisplay [
	^ self comment
]
