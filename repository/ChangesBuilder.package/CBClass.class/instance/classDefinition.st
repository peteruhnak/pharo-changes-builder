generating
classDefinition
	self assert: [ name isString & name isNotEmpty ].
	self assert: [ parent isString & parent isNotEmpty ].
	self assert: [ instanceVariables isCollection ].
	self assert: [ instanceVariables allSatisfy: #isString ].
	self assert: [ package isString & package isNotEmpty ].
	^ '<1s> subclass: #<2s><n><t>instanceVariableNames: <3p><n><t>classVariableNames: <4p><n><t>poolDictionaries: ''''<n><t>category: <5p>'
		expandMacrosWithArguments:
			{parent.
			name.
			self instanceVariables sorted joinUsing: ' '.
			self classVariables sorted joinUsing: ' '.
			package}