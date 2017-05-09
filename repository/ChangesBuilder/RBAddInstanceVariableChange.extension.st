Extension { #name : #RBAddInstanceVariableChange }

{ #category : #'*ChangesBuilder' }
RBAddInstanceVariableChange >> oldVersionTextToDisplay [
	| class |
	class := Smalltalk at: className asSymbol ifAbsent: [ ^ super oldVersionTextToDisplay ].
	self isMeta
		ifTrue: [ class := class class ].
	(class hasInstVarNamed: self variable)
		ifTrue: [ ^ 'Add instance variable <1s> to <2s>'
				expandMacrosWith: self variable
				with: self displayClassName ]
		ifFalse: [ ^ super oldVersionTextToDisplay ]
]
