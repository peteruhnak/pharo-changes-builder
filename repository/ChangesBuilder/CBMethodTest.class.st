Class {
	#name : #CBMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'method'
	],
	#category : 'ChangesBuilder-Tests'
}

{ #category : #asserting }
CBMethodTest >> assertMethod: actualCode equals: expectedCode [
	self
		assert: (RBParser parseMethod: actualCode) formattedCode
		equals: (RBParser parseMethod: expectedCode) formattedCode
]

{ #category : #tests }
CBMethodTest >> testAsArgumentName [
	method := CBMethod basicNew.
	self assert: (method asArgumentName: 'dog') equals: 'aDog'.
	self assert: (method asArgumentName: 'old') equals: 'anOld'
]

{ #category : #tests }
CBMethodTest >> testAsComment [
	method := CBMethod new.
	self assert: (method asComment: 'text') equals: 'text'.
	self assert: (method asComment: 't"e"xt') equals: 't""e""xt'.
]

{ #category : #tests }
CBMethodTest >> testGetter [
	method := CBMethod new getter: 'var'.
	self
		assertMethod: method source
		equals:
			'var
	^ var'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testGetterWithComment [
	method := CBMethod new getter: 'var' comment: 'comment'.
	self
		assertMethod: method source
		equals:
			'var
	"comment"
	^ var'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testGetterWithCommentDefaultValue [
	method := CBMethod new getter: 'var' comment: 'comment' defaultValue: '12'.
	self
		assertMethod: method source
		equals:
			'var
	"comment"
	^ var ifNil: [ var := 12 ]'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testGetterWithDefaultValue [
	method := CBMethod new getter: 'var' defaultValue: '12'.
	self
		assertMethod: method source
		equals:
			'var
	^ var ifNil: [ var := 12 ]'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testSelector [
	method := CBMethod new source: 'a: aWhatever ^ nil'.
	self assert: method selector equals: #a:
]

{ #category : #tests }
CBMethodTest >> testSetter [
	method := CBMethod new setter: 'var' argument: 'variable'.
	self
		assertMethod: method source
		equals:
			'var: aVariable
	var := aVariable'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testSetterWithComment [
	method := CBMethod new setter: 'var' argument: 'variable' comment: 'hello'.
	self
		assertMethod: method source
		equals:
			'var: aVariable
	"hello"
	var := aVariable'.
	self assert: method protocol equals: 'accessing'
]
