Class {
	#name : #CBTemplateMethodBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'method',
		'builder'
	],
	#category : 'ChangesBuilder-Tests'
}

{ #category : #initialization }
CBTemplateMethodBuilderTest >> setUp [
	super setUp.
	builder := CBTemplateMethodBuilder new
]

{ #category : #tests }
CBTemplateMethodBuilderTest >> testBasic [
	method := builder
		template: 'hello';
		protocol: 'my-protocol';
		method.
	self assert: method protocol equals: 'my-protocol'.
	self assert: method source equals: 'hello'
]

{ #category : #tests }
CBTemplateMethodBuilderTest >> testSource [
	self
		assert:
			(builder
				template: 'hello';
				source)
		equals: 'hello'
]

{ #category : #tests }
CBTemplateMethodBuilderTest >> testUseFormatDictionary [
	builder useFormat.
	builder template: 'hello{name}'.
	self assert: (builder sourceOn: {'name' -> 'You'} asDictionary) equals: 'helloYou'
]

{ #category : #tests }
CBTemplateMethodBuilderTest >> testUseFormatIndexed [
	builder useFormat.
	builder template: 'hello{1}'.
	self assert: (builder sourceOn: {'You'}) equals: 'helloYou'
]

{ #category : #tests }
CBTemplateMethodBuilderTest >> testUseMacros [
	builder useMacros.
	builder template: 'hello<1s>'.
	self assert: (builder sourceOn: {'You'}) equals: 'helloYou'
]
