utility
asArgumentName: aString
	^ (aString first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ]) , aString capitalized