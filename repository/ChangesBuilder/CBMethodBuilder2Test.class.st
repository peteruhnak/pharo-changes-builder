Class {
	#name : #CBMethodBuilder2Test,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : 'ChangesBuilder-Tests'
}

{ #category : #asserting }
CBMethodBuilder2Test >> assertMethod: actualCode equals: expectedCode [
	self
		assert: (RBParser parseMethod: actualCode) formattedCode
		equals: (RBParser parseMethod: expectedCode) formattedCode
]

{ #category : #running }
CBMethodBuilder2Test >> setUp [
	builder := CBMethodBuilder2 new
]

{ #category : #tests }
CBMethodBuilder2Test >> testBuildGetter [
	builder selector: 'item'.
	builder addComment: 'hello'.
	builder addPragma: (Pragma keyword: #generated arguments: {}).
	self
		assertMethod: builder buildGetter
		equals:
			'item
	"hello"
	<generated>
	^ item'
]

{ #category : #tests }
CBMethodBuilder2Test >> testBuildSelectorKeyword [
	builder
		arguments:
			{'Fraction'.
			Integer};
		selector: 'add:to:'.
	self assertMethod: builder buildSelector equals: 'add: aFraction to: anInteger'
]

{ #category : #tests }
CBMethodBuilder2Test >> testBuildSelectorUnary [
	builder
		argument: 'Object';
		selector: 'object'.
	self assertMethod: builder buildSelector equals: 'object'
]

{ #category : #tests }
CBMethodBuilder2Test >> testBuildSetter [
	builder selector: #item:.
	builder arguments: { 'Item' }.
	builder addComment: 'hello'.
	builder addPragma: (Pragma keyword: #generated arguments: {}).
	self
		assertMethod: builder buildSetter
		equals:
			'item: anItem
	"hello"
	<generated>
	item := anItem'
]

{ #category : #tests }
CBMethodBuilder2Test >> testWithComment [
	builder comments: {'hello' . 'world'}.
	self
		assert: builder buildComment
		equals:
			'"hello
	world"'
]

{ #category : #tests }
CBMethodBuilder2Test >> testWithPragma [
	builder addPragma: (Pragma keyword: #generated arguments: {}).
	builder addPragma: (Pragma keyword: #hello:world: arguments: (Array with: 'a' with: 'b')).
	self
		assert: builder buildPragmas
		equals:
			'<generated>
	<hello: ''a'' world: ''b''>'
]
