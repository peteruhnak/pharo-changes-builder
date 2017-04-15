definition
getter: aVariableName delegateFrom: aString
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	^ <2s> <1s>' expandMacrosWith: aVariableName with: aString)