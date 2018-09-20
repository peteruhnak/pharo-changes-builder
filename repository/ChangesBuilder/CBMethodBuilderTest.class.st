Class {
	#name : #CBMethodBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : 'ChangesBuilder-Tests'
}

{ #category : #tests }
CBMethodBuilderTest >> testAddComment [
	builder := CBMethodBuilder new.
	builder addComment: 'hello'.
	self assert: (builder asComment: 'text') equals: 'text'.
	self assert: (builder asComment: 't"e"xt') equals: 't""e""xt'
]

{ #category : #tests }
CBMethodBuilderTest >> testAddIndent [
	builder := CBMethodBuilder new.
	builder addLine: 'first'.
	self
		assert: builder source
		equals:
			'first
'.
	builder addIndent.
	builder addLine: 'second'.
	self
		assert: builder source
		equals:
			'first
	second
'.
	builder addIndent.
	builder addLine: 'third'.
	self
		assert: builder source
		equals:
			'first
	second
		third
'
]

{ #category : #tests }
CBMethodBuilderTest >> testAddLine [
	builder := CBMethodBuilder new.
	builder addLine: 'first'.
	self assert: builder source equals: 'first
'.
	builder addLine: 'second'.
	self assert: builder source equals: 'first
second
'
]

{ #category : #tests }
CBMethodBuilderTest >> testAsComment [
	builder := CBMethodBuilder new.
	self assert: (builder asComment: 'text') equals: 'text'.
	self assert: (builder asComment: 't"e"xt') equals: 't""e""xt'
]

{ #category : #tests }
CBMethodBuilderTest >> testComment [
	builder := CBMethodBuilder new.
	builder addComment: 'first'.
	self
		assert: builder source
		equals:
			'"first"
'
]

{ #category : #tests }
CBMethodBuilderTest >> testIndentAfterSelector [
	builder := CBMethodBuilder new.
	builder selector: 'first'.
	builder addLine: 'second'.
	self assert: builder source equals: 'first
	second
'
]

{ #category : #tests }
CBMethodBuilderTest >> testRemoveIndent [
	builder := CBMethodBuilder new.
	builder addIndent.
	builder addLine: 'first'.
	self
		assert: builder source
		equals:
			'	first
'.
	builder removeIndent.
	builder addLine: 'second'.
	self
		assert: builder source
		equals:
			'	first
second
'
]

{ #category : #tests }
CBMethodBuilderTest >> testSelector [
	builder := CBMethodBuilder new.
	builder selector: 'first'.
	self assert: builder source equals: 'first
'
]

{ #category : #tests }
CBMethodBuilderTest >> testStart [
	builder := CBMethodBuilder new.
	self assert: builder source equals: ''
]
