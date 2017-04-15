Class {
	#name : #CBChangeSetTest,
	#superclass : #TestCase,
	#instVars : [
		'changeSet'
	],
	#category : 'ChangesBuilder-Tests'
}

{ #category : #running }
CBChangeSetTest >> setUp [
	super setUp.
	changeSet := CBChangeSet new
]

{ #category : #running }
CBChangeSetTest >> testAddClass [
	| class |
	class := CBClass new name: 'GeneratedClass'.
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}
]

{ #category : #running }
CBChangeSetTest >> testAddClassChanges [
	| class |
	class := CBClass new name: 'GeneratedClass'.
	class addInstVarNamed: 'var1'.
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}.
	self
		assert: changeSet allRefactoringChanges first textToDisplay withUnixLineEndings
		equals:
			'Object subclass: #GeneratedClass
	instanceVariableNames: ''var1''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''Unclassified''' withUnixLineEndings
]

{ #category : #running }
CBChangeSetTest >> testClassWithMethodChanges [
	| class |
	class := CBClass new name: 'GeneratedClass'.
	class
		addMethod:
			(CBMethod new
				source: 'meth ^ 1';
				protocol: 'my protocol').
	changeSet addClass: class.
	self assert: changeSet classes equals: {class}.
	self
		assert: changeSet allRefactoringChanges second textToDisplay
		equals:
			'"my protocol"
meth ^ 1'
]
