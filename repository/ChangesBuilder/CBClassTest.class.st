Class {
	#name : #CBClassTest,
	#superclass : #TestCase,
	#instVars : [
		'result',
		'class'
	],
	#category : 'ChangesBuilder-Tests'
}

{ #category : #running }
CBClassTest >> setUp [
	super setUp.
	class := CBClass name: 'MyXXTestClass' parent: 'Object' package: 'GeneratedCode'
]

{ #category : #'tests - adding' }
CBClassTest >> testAddClassVariable [
	class addClassVarNamed: 'something'.
	self assert: class classVariables equals: #(something).
	self assert: class classVarNames equals: #(something).
	self assert: (class hasClassVarNamed: 'something')
]

{ #category : #'tests - adding' }
CBClassTest >> testAddInstanceVariable [
	class addInstVarNamed: 'something'.
	self assert: class instanceVariables equals: #(something).
	self assert: class instVarNames equals: #(something).
	self assert: (class hasInstVarNamed: 'something')
]

{ #category : #'tests - adding' }
CBClassTest >> testAddMetaInstanceVariable [
	class addMetaInstVarNamed: 'something'.
	self assert: class metaInstanceVariables equals: #(something).
	self assert: (class hasMetaInstVarNamed: 'something')
]

{ #category : #'tests - adding' }
CBClassTest >> testAddMetaMethod [
	class addMetaMethod: (CBMethod new getter: 'item').
	self assert: class metaMethods size equals: 1.
	self assert: class methods size equals: 0.
	self assert: class selectors equals: #()
]

{ #category : #'tests - adding' }
CBClassTest >> testAddMethod [
	| method |
	method := CBMethod new getter: 'item'.
	class addMethod: method.
	self assert: class metaMethods size equals: 0.
	self assert: class methods size equals: 1.
	self assert: class selectors equals: #(item).
	self assert: (class methodNamed: #item) equals: method
]

{ #category : #tests }
CBClassTest >> testClassDefinition [
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''''<n><t>classVariableNames: ''''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros
]

{ #category : #tests }
CBClassTest >> testClassDefinitionVarsSorted [
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	class addInstVarNamed: 'var2'.
	class addInstVarNamed: 'var1'.
	class addClassVarNamed: 'clsVar2'.
	class addClassVarNamed: 'clsVar1'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''var1 var2''<n><t>classVariableNames: ''clsVar1 clsVar2''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros
]

{ #category : #tests }
CBClassTest >> testClassDefinitionWithInstanceAndClassVars [
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	class addInstVarNamed: 'var1'.
	class addInstVarNamed: 'var2'.
	class addClassVarNamed: 'clsVar1'.
	class addClassVarNamed: 'clsVar2'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''var1 var2''<n><t>classVariableNames: ''clsVar1 clsVar2''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros
]

{ #category : #tests }
CBClassTest >> testClassDefinitionWithInstanceVars [
	class := CBClass
		name: 'SomeGeneratedClassSomewhere'
		parent: 'OPCGClassTest'
		package: 'Somewhere'.
	class addInstVarNamed: 'var1'.
	class addInstVarNamed: 'var2'.
	self
		assert: class classDefinition
		equals:
			'OPCGClassTest subclass: #SomeGeneratedClassSomewhere<n><t>instanceVariableNames: ''var1 var2''<n><t>classVariableNames: ''''<n><t>poolDictionaries: ''''<n><t>category: ''Somewhere'''
				expandMacros
]

{ #category : #'tests - accessing' }
CBClassTest >> testComment [
	self assert: class comment equals: nil.
	class comment: 'hello'.
	self assert: class comment equals: 'hello'
]

{ #category : #'tests - adding' }
CBClassTest >> testCompileMetaMethod [
	class
		compileMeta:
			'item
	^ item'
		classified: 'accessing'.
	self assert: class methods size equals: 0.
	self assert: class metaMethods size equals: 1.
	self assert: class metaMethods first protocol equals: 'accessing'.
	self
		assert: class metaMethods first source
		equals:
			'item
	^ item'
]

{ #category : #'tests - adding' }
CBClassTest >> testCompileMethod [
	class
		compile:
			'item
	^ item'
		classified: 'accessing'.
	self assert: class metaMethods size equals: 0.
	self assert: class methods size equals: 1.
	self assert: class selectors equals: #(item).
	self assert: class methods first protocol equals: 'accessing'.
	self
		assert: class methods first source
		equals:
			'item
	^ item' expandMacros
]

{ #category : #tests }
CBClassTest >> testCreate [
	result := CBClass name: 'MyClass' parent: 'Something' package: 'Generated'.
	self assert: result name equals: 'MyClass'.
	self assert: result parent equals: 'Something'.
	self assert: result package equals: 'Generated'
]

{ #category : #tests }
CBClassTest >> testFromRealClass [
	| realClass |
	realClass := self class.
	class := CBClass fromClass: realClass.
	self assert: class instanceVariables equals: realClass instanceVariables.
	self assert: class parent equals: realClass superclass name
]

{ #category : #'tests - accessing' }
CBClassTest >> testPackage [
	class package: 'Wherever'.
	self assert: class package equals: 'Wherever'
]

{ #category : #'tests - accessing' }
CBClassTest >> testParent [
	class := CBClass new.
	self assert: class parent equals: 'Object'.
	class parent: 'TestCase'.
	self assert: class parent equals: 'TestCase'
]

{ #category : #'tests - accessing' }
CBClassTest >> testRealClass [
	class name: self class name.
	self assert: class realClass equals: self class.
	class name: 'ThereIsNoSuchClassInTheSystem'.
	self assert: class realClass equals: nil
]
