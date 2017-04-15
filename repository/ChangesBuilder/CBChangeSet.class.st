"
I hold references to refactored classes, and I convert everything to refactoring changes and filter them.
"
Class {
	#name : #CBChangeSet,
	#superclass : #Object,
	#instVars : [
		'classes'
	],
	#category : 'ChangesBuilder-Model'
}

{ #category : #adding }
CBChangeSet >> addClass: aClass [
	classes at: aClass name put: aClass
]

{ #category : #converting }
CBChangeSet >> allRefactoringChanges [
	| model |
	model := RBNamespace new.
	classes
		do: [ :each | 
			| cls meta |
			model defineClass: each classDefinition.
			cls := model classNamed: each name asSymbol.
			each comment ifNotNil: [ model comment: each comment in: cls ].
			each methods do: [ :method | cls compile: method source classified: method protocol ].
			meta := cls theMetaClass.
			each metaMethods
				do: [ :method | meta compile: method source classified: method protocol ] ].
	^ model changes changes
]

{ #category : #accessing }
CBChangeSet >> classes [
	^ classes values
]

{ #category : #initialization }
CBChangeSet >> initialize [
	super initialize.
	classes := OrderedDictionary new
]

{ #category : #converting }
CBChangeSet >> refactoringChanges [
	^ self allRefactoringChanges
		reject: [ :each | each textToDisplay = each oldVersionTextToDisplay ]
]
