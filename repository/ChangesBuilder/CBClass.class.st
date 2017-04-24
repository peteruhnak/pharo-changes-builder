"
I represent a in-memory class that knows how to convert itself to RBChange to generate actual code.

I also provide couple more convenient methods for code definition.
"
Class {
	#name : #CBClass,
	#superclass : #Object,
	#instVars : [
		'name',
		'comment',
		'parent',
		'package',
		'instanceVariables',
		'methods',
		'metaMethods'
	],
	#category : 'ChangesBuilder-Model'
}

{ #category : #'instance creation' }
CBClass class >> name: aString parent: aClass package: aPkgName [
	^ self new
		name: aString;
		parent: aClass;
		package: aPkgName;
		yourself
]

{ #category : #adding }
CBClass >> addInstVarNamed: aString [
	instanceVariables add: aString
]

{ #category : #adding }
CBClass >> addMetaMethod: aMethod [
	metaMethods at: aMethod selector put: aMethod
]

{ #category : #adding }
CBClass >> addMethod: aMethod [
	methods at: aMethod selector put: aMethod
]

{ #category : #generating }
CBClass >> classDefinition [
	self assert: [ name isString & name isNotEmpty ].
	self assert: [ parent isString & parent isNotEmpty ].
	self assert: [ instanceVariables isCollection ].
	self assert: [ instanceVariables allSatisfy: #isString ].
	self assert: [ package isString & package isNotEmpty ].
	^ '<1s> subclass: #<2s><n><t>instanceVariableNames: <3p><n><t>classVariableNames: ''''<n><t>poolDictionaries: ''''<n><t>category: <4p>'
		expandMacrosWith: parent
		with: name
		with: (self instanceVariables joinUsing: ' ')
		with: package
]

{ #category : #accessing }
CBClass >> comment [
	^ comment
]

{ #category : #accessing }
CBClass >> comment: anObject [
	comment := anObject
]

{ #category : #adding }
CBClass >> compile: aString classified: aProtocol [
	self
		addMethod:
			(CBMethod new
				source: aString;
				protocol: aProtocol)
]

{ #category : #adding }
CBClass >> compileMeta: aString classified: aProtocol [
	self
		addMetaMethod:
			(CBMethod new
				source: aString;
				protocol: aProtocol)
]

{ #category : #testing }
CBClass >> hasInstVarNamed: aString [
	^ instanceVariables includes: aString
]

{ #category : #initialization }
CBClass >> initialize [
	super initialize.
	parent := 'Object'.
	package := 'Unclassified'.
	instanceVariables := Set new.
	methods := OrderedDictionary new.
	metaMethods := OrderedDictionary new
]

{ #category : #accessing }
CBClass >> instVarNames [
	^ self instanceVariables
]

{ #category : #accessing }
CBClass >> instanceVariables [
	^ instanceVariables asArray
]

{ #category : #accessing }
CBClass >> metaMethods [
	^ metaMethods values
]

{ #category : #accessing }
CBClass >> methodNamed: aName [
	^ self methods detect: [ :each | each selector = aName ]
]

{ #category : #accessing }
CBClass >> methods [
	^ methods values
]

{ #category : #accessing }
CBClass >> name [
	^ name
]

{ #category : #accessing }
CBClass >> name: aString [
	name := aString
]

{ #category : #accessing }
CBClass >> package [
	^ package
]

{ #category : #accessing }
CBClass >> package: aString [
	package := aString
]

{ #category : #accessing }
CBClass >> parent [
	^ parent
]

{ #category : #accessing }
CBClass >> parent: aClass [
	parent := aClass
]

{ #category : #printing }
CBClass >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< '(';
		<< name printString;
		<< ', ';
		<< 'a('.
	instanceVariables do: [ :each | aStream << each ] separatedBy: [ aStream << ',' ].
	aStream
		<< '),';
		<< 'm('.
		aStream << methods size asString.
"	methods keys do: [ :each | aStream << each ] separatedBy: [ aStream << ',' ]."
	aStream << '))'
]

{ #category : #accessing }
CBClass >> realClass [
	^ (Smalltalk hasClassNamed: self name)
		ifTrue: [ self name asClass ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
CBClass >> selectors [
	^ methods keys
]
