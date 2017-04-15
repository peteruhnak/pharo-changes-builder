Class {
	#name : #CBMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'method'
	],
	#category : 'ChangesBuilder-Tests'
}

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
		assert: method source
		equals:
			'var
	^ var'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testGetterWithComment [
	method := CBMethod new getter: 'var' comment: 'comment'.
	self
		assert: method source
		equals:
			'var
	"comment"
	^ var'.
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
		assert: method source
		equals:
			'var: aVariable
	var := aVariable'.
	self assert: method protocol equals: 'accessing'
]

{ #category : #tests }
CBMethodTest >> testSetterWithComment [
	method := CBMethod new setter: 'var' argument: 'variable' comment: 'hello'.
	self
		assert: method source
		equals:
			'var: aVariable
	"hello"
	var := aVariable'.
	self assert: method protocol equals: 'accessing'
]
