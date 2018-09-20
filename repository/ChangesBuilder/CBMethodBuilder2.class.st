Class {
	#name : #CBMethodBuilder2,
	#superclass : #Object,
	#instVars : [
		'selector',
		'arguments',
		'comments',
		'pragmas'
	],
	#category : 'ChangesBuilder-Model'
}

{ #category : #accessing }
CBMethodBuilder2 >> addArgument: anArgument [
	arguments add: anArgument
]

{ #category : #accessing }
CBMethodBuilder2 >> addComment: aComment [
	comments add: aComment
]

{ #category : #accessing }
CBMethodBuilder2 >> addPragma: aPragma [
	pragmas add: aPragma
]

{ #category : #accessing }
CBMethodBuilder2 >> argument: anArgument [
	arguments
		removeAll;
		add: anArgument
]

{ #category : #accessing }
CBMethodBuilder2 >> arguments: aCollection [
	arguments := aCollection asOrderedCollection
]

{ #category : #utility }
CBMethodBuilder2 >> asArgument: anObject [
	| name |
	name := anObject asString.
	^ (name first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ]) , name capitalized
]

{ #category : #utility }
CBMethodBuilder2 >> asComment: aString [
	"aString asComment duplicates only double quotes that are alone, which is not what I want"
	^ aString copyReplaceAll: '"' with: '""'
]

{ #category : #utility }
CBMethodBuilder2 >> asPragma: aPragma [
	^ aPragma printString
]

{ #category : #building }
CBMethodBuilder2 >> basicBuildGetter [
	selector := selector asRetriever.
	^ String
		<< [ :stream | 
			stream << self buildPreambles.
			stream << '^ ' << selector ]
]

{ #category : #building }
CBMethodBuilder2 >> basicBuildSetter [
	selector := selector asMutator.
	^ String
		<< [ :stream | 
			stream << self buildPreambles.
			stream << selector asRetriever << ' := ' << (self asArgument: arguments first) ]
]

{ #category : #building }
CBMethodBuilder2 >> buildComment [
	^ String
		<< [ :stream | 
			stream << '"'.
			comments do: [ :each | stream << (self asComment: each) ] separatedBy: [ stream cr tab ].
			stream << '"' ]
]

{ #category : #building }
CBMethodBuilder2 >> buildGetter [
	^ (RBParser parseMethod: self basicBuildGetter) formattedCode
]

{ #category : #building }
CBMethodBuilder2 >> buildPragmas [
	^ String
		<<
			[ :stream | pragmas do: [ :each | stream << (self asPragma: each) ] separatedBy: [ stream cr tab ] ]
]

{ #category : #building }
CBMethodBuilder2 >> buildPreambles [
	^ String
		<< [ :stream | 
			stream << self buildSelector.
			self buildComment ifNotEmpty: [ :com | stream tab << com ].
			self buildPragmas ifNotEmpty: [ :prag | stream tab << prag ] ]
]

{ #category : #building }
CBMethodBuilder2 >> buildSelector [
	^ String
		<< [ :stream | 
			selector numArgs = 0
				ifTrue: [ stream << selector ]
				ifFalse: [ selector keywords
						with: arguments
						do: [ :kw :arg | stream << kw << (self asArgument: arg) << ' ' ].
					stream cr ] ]
]

{ #category : #building }
CBMethodBuilder2 >> buildSetter [
	^ (RBParser parseMethod: self basicBuildSetter) formattedCode
]

{ #category : #accessing }
CBMethodBuilder2 >> comment: aComment [
	comments
		removeAll;
		add: aComment
]

{ #category : #accessing }
CBMethodBuilder2 >> comments: aCollection [
	comments := aCollection asOrderedCollection
]

{ #category : #initialization }
CBMethodBuilder2 >> initialize [
	super initialize.
	arguments := OrderedCollection new.
	comments := OrderedCollection new.
	pragmas := OrderedCollection new
]

{ #category : #accessing }
CBMethodBuilder2 >> pragma: aPragma [
	pragmas
		removeAll;
		add: aPragma
]

{ #category : #accessing }
CBMethodBuilder2 >> pragmas: aCollection [
	pragmas := aCollection asOrderedCollection
]

{ #category : #accessing }
CBMethodBuilder2 >> selector: aSelector [
	selector := aSelector asSymbol
]
