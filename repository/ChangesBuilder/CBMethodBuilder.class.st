Class {
	#name : #CBMethodBuilder,
	#superclass : #Object,
	#instVars : [
		'source',
		'indent'
	],
	#category : 'ChangesBuilder-Model'
}

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
