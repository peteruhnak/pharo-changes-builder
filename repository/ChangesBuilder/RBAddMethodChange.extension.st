Extension { #name : #RBAddMethodChange }

{ #category : #'*ChangesBuilder' }
RBAddMethodChange >> oldVersionTextToDisplay [
	| class |
	class := Smalltalk at: className asSymbol ifAbsent: [ ^ super oldVersionTextToDisplay ].
	isMeta
		ifTrue: [ class := class theMetaClass ].
	^ class methodDict
		at: self selector
		ifPresent: [ :method | '"' , method protocol , '"' , String cr , method sourceCode ]
		ifAbsent: [ super oldVersionTextToDisplay ]
]

{ #category : #'*ChangesBuilder' }
RBAddMethodChange >> textToDisplay [
	^ '"' , self protocol , '"' , String cr , self source
]
