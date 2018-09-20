"
I am a method builder that stores the source as a template and then performs a replacement based on the selected strategy.
"
Class {
	#name : #CBTemplateMethodBuilder,
	#superclass : #Object,
	#instVars : [
		'template',
		'protocol',
		'templateStrategory'
	],
	#category : 'ChangesBuilder-Model'
}

{ #category : #'instance creation' }
CBTemplateMethodBuilder class >> forMustache [
	^ self new
		useMustache;
		yourself
]

{ #category : #initialization }
CBTemplateMethodBuilder >> initialize [
	super initialize.
	self useFormat
]

{ #category : #building }
CBTemplateMethodBuilder >> method [
	^ self methodOn: {}
]

{ #category : #building }
CBTemplateMethodBuilder >> methodOn: aContext [
	^ CBMethod new
		source: (self sourceOn: aContext);
		protocol: protocol;
		yourself
]

{ #category : #accessing }
CBTemplateMethodBuilder >> protocol: anObject [
	protocol := anObject
]

{ #category : #building }
CBTemplateMethodBuilder >> runStrategyOn: aTemplate context: aContext [
	^ templateStrategory value: aTemplate value: aContext
]

{ #category : #building }
CBTemplateMethodBuilder >> source [
	^ self sourceOn: {}
]

{ #category : #building }
CBTemplateMethodBuilder >> sourceOn: aContext [
	^ self runStrategyOn: template context: aContext
]

{ #category : #accessing }
CBTemplateMethodBuilder >> template: anObject [
	template := anObject
]

{ #category : #strategies }
CBTemplateMethodBuilder >> templateStrategy: aTemplateContextBlock [
	templateStrategory := aTemplateContextBlock
]

{ #category : #strategies }
CBTemplateMethodBuilder >> useFormat [
	self templateStrategy: [ :aTemplate :aContext | aTemplate format: aContext ]
]

{ #category : #strategies }
CBTemplateMethodBuilder >> useMacros [
	self
		templateStrategy: [ :aTemplate :aContext | aTemplate expandMacrosWithArguments: aContext ]
]

{ #category : #strategies }
CBTemplateMethodBuilder >> useMustache [
	self
		templateStrategy: [ :aTemplate :aContext | (MustacheTemplate on: aTemplate) value: aContext asDictionary ]
]
