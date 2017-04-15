"
I represent a in-memory method that knows how to convert itself to RBChange to generate actual code.

I also provide couple more convenient methods for code definition.
"
Class {
	#name : #CBMethod,
	#superclass : #Object,
	#instVars : [
		'source',
		'protocol'
	],
	#category : 'ChangesBuilder-Model'
}

{ #category : #utility }
CBMethod >> asArgumentName: aString [
	^ (aString first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ]) , aString capitalized
]

{ #category : #utility }
CBMethod >> asComment: aString [
	"aString asComment duplicates only double quotes that are alone, which is not what I want"
	^ aString copyReplaceAll: '"' with: '""'
]

{ #category : #definition }
CBMethod >> getter: aVariableName [
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	^ <1s>' expandMacrosWith: aVariableName)
]

{ #category : #definition }
CBMethod >> getter: aVariableName comment: aComment [
	aComment ifNil: [ ^ self getter: aVariableName ].
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	"<2s>"
	^ <1s>' expandMacrosWith: aVariableName with: (self asComment: aComment))
]

{ #category : #definition }
CBMethod >> getter: aVariableName delegateFrom: aString [
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	^ <2s> <1s>' expandMacrosWith: aVariableName with: aString)
]

{ #category : #initialization }
CBMethod >> initialize [
	super initialize.
	protocol := 'as yet unclassified'
]

{ #category : #accessing }
CBMethod >> protocol [
	^ protocol
]

{ #category : #accessing }
CBMethod >> protocol: aString [
	protocol := aString
]

{ #category : #accessing }
CBMethod >> selector [
	^ (RBParser parseMethod: source) selector
]

{ #category : #definition }
CBMethod >> setter: aVariableName argument: anArgumentName [
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	<1s> := <2s>' expandMacrosWith: aVariableName with: (self asArgumentName: anArgumentName))
]

{ #category : #definition }
CBMethod >> setter: aVariableName argument: anArgumentName comment: aComment [
	aComment ifNil: [ ^ self setter: aVariableName argument: anArgumentName ].
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	"<3s>"
	<1s> := <2s>'
				expandMacrosWith: aVariableName
				with: (self asArgumentName: anArgumentName)
				with: (self asComment: aComment))
]

{ #category : #definition }
CBMethod >> setter: aVariableName argument: anArgumentName delegateTo: aString [
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	<3s> <1s>: <2s>'
				expandMacrosWith: aVariableName
				with: (self asArgumentName: anArgumentName)
				with: aString)
]

{ #category : #accessing }
CBMethod >> source [
	^ source
]

{ #category : #accessing }
CBMethod >> source: aString [
	source := aString
]
