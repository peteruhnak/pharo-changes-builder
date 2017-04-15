*ChangesBuilder
oldVersionTextToDisplay
	(Smalltalk hasClassNamed: className)
		ifFalse: [ ^ '' ].
	^ '<1s> subclass: #<2s><n><t>instanceVariableNames: <3p><n><t>classVariableNames: ''''<n><t>poolDictionaries: ''''<n><t>category: <4p>'
		expandMacrosWith: (Smalltalk classNamed: className) superclass name
		with: className
		with: ((Smalltalk classNamed: className) instVarNames joinUsing: ' ')
		with: category asString