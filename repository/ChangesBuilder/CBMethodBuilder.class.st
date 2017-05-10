"
A utility class for building code piece by piece.

Note that this was first attempt and I do not like this class, so don't get too attached to it...
"
Class {
	#name : #CBMethodBuilder,
	#superclass : #Object,
	#instVars : [
		'source',
		'indent'
	],
	#category : 'ChangesBuilder-Model'
}

{ #category : #adding }
CBMethodBuilder >> addComment: aString [
	self addLine: '"' , (self asComment: aString) , '"'
]

{ #category : #accessing }
CBMethodBuilder >> addIndent [
	indent := indent + 1
]

{ #category : #accessing }
CBMethodBuilder >> addLine: aString [
	source := String
		streamContents: [ :stream | 
			stream << source.
			indent timesRepeat: [ stream tab ].
			stream << aString.
			stream cr ]
]

{ #category : #utility }
CBMethodBuilder >> asComment: aString [
	"aString asComment duplicates only double quotes that are alone, which is not what I want"
	^ aString copyReplaceAll: '"' with: '""'
]

{ #category : #initialization }
CBMethodBuilder >> initialize [
	source := ''.
	indent := 0
]

{ #category : #accessing }
CBMethodBuilder >> removeIndent [
	indent := indent - 1
]

{ #category : #accessing }
CBMethodBuilder >> selector: aString [
	self addLine: aString.
	self addIndent
]

{ #category : #accessing }
CBMethodBuilder >> source [
	^ source
]
