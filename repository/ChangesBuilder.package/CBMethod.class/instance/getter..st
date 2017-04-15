definition
getter: aVariableName
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	^ <1s>' expandMacrosWith: aVariableName)