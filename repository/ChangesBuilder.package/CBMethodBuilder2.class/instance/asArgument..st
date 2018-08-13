utility
asArgument: anObject
	| name |
	name := anObject asString.
	^ (name first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ]) , name capitalized